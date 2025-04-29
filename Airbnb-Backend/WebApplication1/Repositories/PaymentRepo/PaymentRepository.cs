using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Stripe;
using WebApplication1.Configurations;
using WebApplication1.DTOS.AvailabilityCalendar;
using WebApplication1.DTOS.Payment;
using WebApplication1.Interfaces;
using WebApplication1.Models;
using WebApplication1.Models.Enums;
using WebApplication1.Repositories;

namespace WebApplication1.Repositories.Payment
{
    public class PaymentRepository : GenericRepository<Models.Payment>, IPayment
    {
        #region Dependency Injection
        private readonly AirbnbDBContext _context;
        private readonly IMapper _mapper;
        private readonly IAvailabilityCalendar _availabilityCalendarRepository;
        private readonly IStripe _stripeRepository;

        public PaymentRepository(AirbnbDBContext context, IMapper mapper, IAvailabilityCalendar availabilityCalendarRepository, IStripe stripeRepository, IHttpContextAccessor httpContextAccessor) : base(context, mapper, httpContextAccessor)
        {
            _context = context;
            _mapper = mapper;
            _availabilityCalendarRepository = availabilityCalendarRepository;
            _stripeRepository = stripeRepository;
        }
        #endregion

        #region Create Payment
        public async Task<PaymentResponseDTO> CreatePaymentAsync((PaymentIntent intent, Charge charge, ConfirmPaymentDTO dto) source)
        {
            var createPaymentDto = _mapper.Map<CreatePaymentDTO>(source);

            createPaymentDto.PaymentType = Enum.Parse<PaymentType>(source.intent.Metadata["paymentType"]);
            createPaymentDto.BookingId = Guid.Parse(source.intent.Metadata["bookingId"]);
            createPaymentDto.CurrencyId = int.Parse(source.intent.Metadata["currency"]);
            createPaymentDto.UserId = GetCurrentUserId();
            createPaymentDto.FailureMessage = source.charge?.FailureMessage ?? source.intent?.LastPaymentError?.Message;
            createPaymentDto.PaymentMethodId = int.Parse(source.intent.Metadata["paymentMethodId"]);

            var payment = _mapper.Map<Models.Payment>(createPaymentDto);
            _context.Payments.Add(payment);
            await _context.SaveChangesAsync();

            return _mapper.Map<PaymentResponseDTO>(payment);
        }
        #endregion

        #region Handle Post Payment Success
        public async Task HandlePostPaymentSuccess(Guid bookingId)
        {
            var booking = await _context.Bookings.FindAsync(bookingId) ?? throw new Exception("Booking not found");
            booking.Status = BookingStatus.Confirmed;
            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();

            await _availabilityCalendarRepository.MarkDatesUnavailable(booking.ListingId, booking.CheckInDate, booking.CheckOutDate);
            await _context.SaveChangesAsync();
        }
        #endregion

        #region Handle Payment Success (Session Completed)
        public async Task<PaymentResponseDTO> HandleCheckoutSessionCompleted(string sessionId)
        {
            var session = await _stripeRepository.GetSession(sessionId);
            if (session == null || string.IsNullOrEmpty(session.PaymentIntentId))
                throw new Exception("Invalid session or missing PaymentIntent ID.");

            var paymentIntent = await _stripeRepository.GetPaymentIntent(session.PaymentIntentId) ?? throw new Exception("PaymentIntent not found.");

            var charge = await _stripeRepository.GetCharge(paymentIntent.LatestChargeId);

            var confirmDto = new ConfirmPaymentDTO { PaymentIntentId = paymentIntent.Id };
            var paymentResponse = await CreatePaymentAsync((paymentIntent, charge, confirmDto));
            if (Enum.TryParse<PaymentStatus>(paymentResponse.Status, true, out var status) && status == PaymentStatus.Completed)
            {
                var bookingId = Guid.Parse(session.Metadata["bookingId"]);
                await HandlePostPaymentSuccess(bookingId);
            }
            var booking = await _context.Bookings
                .Include(b => b.Listing)
                .FirstOrDefaultAsync(b => b.Id == Guid.Parse(session.Metadata["bookingId"])) ?? throw new Exception("Booking not found.");
            booking.PaymentIntentId = session.PaymentIntentId;
            booking.PaymentTimeOut = DateTime.UtcNow.AddMinutes(30);

            _context.Bookings.Update(booking);
            await _context.SaveChangesAsync();
            return paymentResponse;
        }
        #endregion

        #region Refund Payment
        public async Task RefundBookingPaymentAsync(Booking booking)
        {
            var policy = booking.Listing.CancellationPolicy;
            var payment = await GetLatestSuccessfulPaymentWithPolicyAsync(booking.Id);

            var refundPercentage = CalculateRefundPercentage(booking, policy);
            if (refundPercentage == 0)
                throw new InvalidOperationException("Refund not allowed based on the policy.");

            var refundAmount = (long)(payment.Amount * refundPercentage * 100);

            await _stripeRepository.RefundAsync(payment.TransactionId, refundAmount);
            await MarkPaymentAsRefundedAsync(payment);
        }
        public async Task MarkPaymentAsRefundedAsync(Models.Payment payment)
        {
            payment.Status = PaymentStatus.Refunded;
            payment.ProccessedAt = DateTime.UtcNow;
            await UpdateAsync(payment);
        }
        #endregion

        #region Get refund amount
        public async Task<decimal> GetRefundAmountAsync(Guid bookingId)
        {
            var payment = await GetLatestSuccessfulPaymentWithPolicyAsync(bookingId);
            var policy = payment.Booking.Listing.CancellationPolicy;
            var refundPercentage = CalculateRefundPercentage(payment.Booking, policy);
            if (refundPercentage == 0)
                throw new InvalidOperationException("Refund not allowed based on the policy.");
            return (long)(payment.Amount * refundPercentage);
        }
        #endregion

        #region Helper Method   
        private async Task<Models.Payment> GetLatestSuccessfulPaymentWithPolicyAsync(Guid bookingId)
        {
            var payment = await _context.Payments
                .Include(p => p.Booking)
                    .ThenInclude(b => b.Listing)
                        .ThenInclude(l => l.CancellationPolicy)
                .Where(p => p.BookingId == bookingId && p.Status == PaymentStatus.Completed)
                .OrderByDescending(p => p.PaymentDate)
                .FirstOrDefaultAsync() ?? throw new Exception("No successful payment found to refund.");

            if (payment.Status == PaymentStatus.Refunded)
                throw new Exception("Payment has already been refunded.");

            if (string.IsNullOrEmpty(payment.TransactionId))
                throw new Exception("Transaction ID missing, cannot process refund.");

            return payment;
        }
        private static decimal CalculateRefundPercentage(Booking booking, CancellationPolicy policy)
        {
            var today = DateTime.UtcNow.Date;
            var checkInDate = booking.CheckInDate.Date;

            var daysBeforeCheckIn = (checkInDate - today).TotalDays;

            if (checkInDate <= today)
            {
                return 0;
            }
            else if (daysBeforeCheckIn >= policy.FullRefundDays)
            {
                return 1.0m;
            }
            else if (policy.PartialRefundDays.HasValue &&
                     daysBeforeCheckIn >= policy.PartialRefundDays.Value &&
                     policy.PartialRefundPercentage.HasValue)
            {
                return policy.PartialRefundPercentage.Value / 100m;
            }

            return 0;
        }
        #endregion
    }
}