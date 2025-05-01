import { Component, OnInit , HostListener} from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { PaymentService } from '../../core/services/payment.service';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';
import { DatePipe } from '@angular/common';
import { Booking2 } from '../../core/models/Booking';
import { BookingService } from '../../core/services/booking.service';
import { PaymentMethods } from '../../core/models/PaymentMethods';
import { ImagesService } from '../../core/services/images.service';

@Component({
  selector: 'app-payment',
  standalone: true,
  imports: [FormsModule, CommonModule, DatePipe],
  templateUrl: './payment-component.component.html',
  styleUrls: ['./payment-component.component.css']
})
export class PaymentComponent implements OnInit {
  bookingId!: string;
  paymentType: number = 0;
  selectedPaymentMethod!: PaymentMethods;
  paymentMethods: PaymentMethods[] = [];
  bookingDetails!: Booking2;
  isLoading: boolean = true;
  loadingPaymentMethods: boolean = true;
  paymentError: string | null = null;
  showPaymentMethodsDropdown: boolean = false;

  constructor(
    private route: ActivatedRoute,
    private paymentService: PaymentService,
    private bookingService: BookingService,
    public imgService: ImagesService
  ) {}

  ngOnInit() {
    this.route.queryParams.subscribe(params => {
      this.bookingId = params['bookingId'];
      console.log('Booking ID:', this.bookingId); // Debug log

      // Load booking details first, then payment methods
      this.loadBookingDetails();
      this.loadPaymentMethods();

    });
  }
  // Add this to your component
  loadBookingDetails() {
    this.bookingService.getBookingById(this.bookingId).subscribe({
      next: (details) => {
        this.bookingDetails = details;
        this.isLoading = false;
      },
      error: (err) => {
        this.isLoading = false;
        console.error('Failed to load booking details', err);
      }
    });
  }


  togglePaymentMethodsDropdown() {
    this.showPaymentMethodsDropdown = !this.showPaymentMethodsDropdown;
  }
// Method to select a payment method
  selectPaymentMethod(method: PaymentMethods) {
    this.selectedPaymentMethod = method;
    this.showPaymentMethodsDropdown = false; // Close dropdown after selection
  }

  loadPaymentMethods() {
    this.loadingPaymentMethods = true;
    this.paymentService.getPaymentMethods().subscribe({
      next: (methods) => {
        this.paymentMethods = methods;
        if (methods.length > 0) {
          this.selectedPaymentMethod = methods[0];
        }
        this.loadingPaymentMethods = false;
      },
      error: (err) => {
        console.error('Error loading payment methods:', err);
        this.loadingPaymentMethods = false;
        this.paymentError = 'Failed to load payment methods';
      }
    });
  }
  proceedToPayment() {
    if (this.isLoading || !this.bookingDetails || !this.selectedPaymentMethod) return;

    const paymentRequest = {
      paymentType: this.paymentType,
      paymentMethodId: this.selectedPaymentMethod.id
    };

    this.isLoading = true;
    this.paymentService.createCheckoutSession(this.bookingId, paymentRequest).subscribe({
      next: (res) => {
        if (res.url) {
          window.location.href = res.url;
        }
      },
      error: (err) => {
        this.isLoading = false;
        this.paymentError = 'Payment failed. Please try again.';
        console.error('Payment failed', err);
      }
    });
  }


  calculateNights(checkInDate: Date | string, checkOutDate: Date | string): number {
    if (!checkInDate || !checkOutDate) return 0;

    const checkIn = typeof checkInDate === 'string' ? new Date(checkInDate) : checkInDate;
    const checkOut = typeof checkOutDate === 'string' ? new Date(checkOutDate) : checkOutDate;

    const diffTime = Math.abs(checkOut.getTime() - checkIn.getTime());
    return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
  }

  getDueNowAmount(): number {
    if (!this.bookingDetails) return 0;
    return this.paymentType === 0 ? this.bookingDetails.totalPrice : this.bookingDetails.totalPrice / 2;
  }
  getPaymentMethodImage(method: PaymentMethods): string {
    const methodName = method.name.toLowerCase();

  if (methodName.includes('apple pay')) {
      return 'Apple-Pay-logo.png';
    } else if (methodName.includes('google pay')) {
      return 'google-pay-logo.png';
    } else if (methodName.includes('carddebit')) {
      return 'Mastercard_2019_logo.svg.png';
    }
    else{
      return'visa.png';
    }
  }
}
