import { Component, HostListener, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AvailabilityCalendarService } from '../../core/services/availability-calendar.service';
import { DateRangeService } from '../../core/services/date-range.service';
import { BookingService } from '../../core/services/booking.service';
import { ListingsService } from '../../core/services/listings.service';
import { Listing } from '../../core/models/Listing';
import { Router } from '@angular/router';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatNativeDateModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { PaymentService } from '../../core/services/payment.service';
import { MatDatepickerInputEvent } from '@angular/material/datepicker';

interface GuestCounts {
  adults: number;
  children: number;
  infants: number;
  pets: number;
}

interface PriceBreakdown {
  nightlyRate: number;
  nights: number;
  subtotal: number;
  serviceFee: number;
  totalAmount: number;
}

@Component({
  selector: 'app-reservation-card',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatDatepickerModule,
    MatFormFieldModule,
    MatNativeDateModule,
    MatInputModule,
  ],
  templateUrl: './reservation-card.component.html',
  styleUrls: ['./reservation-card.component.css'],
})
export class ReservationCardComponent implements OnInit {
  @Input() listingId!: string;

  isGuestPopupOpen: boolean = false;
  reservedDates: Date[] = [];
  dateRangeErrors: string[] = [];
  listing?: Listing;
  maxGuests: number = 1;
  minDate: Date | null = null;
  maxDate: Date | null = null;
  selectedDateRange: { startDate: Date | null; endDate: Date | null } = {
    startDate: null,
    endDate: null,
  };

  priceBreakdown: PriceBreakdown = {
    nightlyRate: 0,
    nights: 0,
    subtotal: 0,
    serviceFee: 0,
    totalAmount: 0,
  };

  guests: GuestCounts = {
    adults: 1,
    children: 0,
    infants: 0,
    pets: 0,
  };

  constructor(
    private availabilityService: AvailabilityCalendarService,
    private dateRangeService: DateRangeService,
    private bookingService: BookingService,
    private listingsService: ListingsService,
    private paymentService: PaymentService,
    private router: Router
  ) {}

  ngOnInit() {
    if (this.listingId) {
      this.loadInitialDateRange();
      this.loadListingDetails();
    }
  }

  private loadListingDetails() {
    this.listingsService.getListingById(this.listingId).subscribe({
      next: (listing) => {
        this.listing = listing;
        this.maxGuests = listing.capacity;
        this.priceBreakdown.nightlyRate = listing.pricePerNight;
        this.priceBreakdown.serviceFee = listing.serviceFee;
        this.updatePriceCalculation();
      },
      error: (error) => {
        console.error('Error loading listing details:', error);
        this.dateRangeErrors.push('Error loading listing details');
      },
    });
  }

  private loadInitialDateRange() {
    this.availabilityService
      .getAvailabilityCalendarOfListing(this.listingId)
      .subscribe({
        next: (dates) => {
          if (dates && dates.length > 0) {
            // Filter only available dates and sort them
            const availableDates = dates
              .filter((date) => date.isAvailable)
              .map((date) => new Date(date.date))
              .sort((a, b) => a.getTime() - b.getTime());

            if (availableDates.length > 0) {
              this.minDate = availableDates[0];
              this.maxDate = availableDates[availableDates.length - 1];

              // Set initial date range to start at first available date
              this.selectedDateRange = {
                startDate: availableDates[0],
                endDate: null,
              };

              // Update the date range service
              this.dateRangeService.setStartDate(availableDates[0]);
            }

            // Store unavailable dates for filtering
            this.reservedDates = dates
              .filter((date) => !date.isAvailable)
              .map((date) => new Date(date.date));
          }
        },
        error: (error) => {
          console.error('Error loading availability dates:', error);
          this.dateRangeErrors.push('Error loading available dates');
        },
      });
  }

  private updatePriceCalculation() {
    if (
      this.selectedDateRange.startDate &&
      this.selectedDateRange.endDate &&
      this.listing
    ) {
      const nights = Math.ceil(
        (this.selectedDateRange.endDate.getTime() -
          this.selectedDateRange.startDate.getTime()) /
          (1000 * 60 * 60 * 24)
      );

      this.priceBreakdown.nights = nights;
      this.priceBreakdown.subtotal = this.priceBreakdown.nightlyRate * nights;
      this.priceBreakdown.totalAmount =
        this.priceBreakdown.subtotal + this.priceBreakdown.serviceFee;
    }
  }

  private validateDateRange() {
    this.dateRangeErrors = [];

    if (
      this.selectedDateRange.startDate &&
      this.selectedDateRange.endDate &&
      this.listing
    ) {
      // Check if end date is before start date
      if (this.selectedDateRange.endDate < this.selectedDateRange.startDate) {
        this.dateRangeErrors.push(
          'Check-out date cannot be before check-in date'
        );
        this.selectedDateRange.endDate = null;
        return;
      }

      // Calculate number of nights
      const nights = Math.ceil(
        (this.selectedDateRange.endDate.getTime() -
          this.selectedDateRange.startDate.getTime()) /
          (1000 * 60 * 60 * 24)
      );

      // Check minimum nights
      if (nights < this.listing.minNights) {
        this.dateRangeErrors.push(
          `Minimum stay is ${this.listing.minNights} nights`
        );
        this.selectedDateRange.endDate = null;
        return;
      }

      // Check maximum nights
      if (nights > this.listing.maxNights) {
        this.dateRangeErrors.push(
          `Maximum stay is ${this.listing.maxNights} nights`
        );
        this.selectedDateRange.endDate = null;
        return;
      }

      this.checkAvailability().then(() => {
        if (this.dateRangeErrors.length === 0) {
          this.updatePriceCalculation();
        }
      });
    }
  }

  private loadAvailableDates() {
    this.availabilityService
      .getAvailabilityCalendarOfListing(this.listingId)
      .subscribe({
        next: (dates) => {
          this.reservedDates = dates
            .filter((date) => !date.isAvailable)
            .map((date) => new Date(date.date));
        },
        error: (error) => {
          console.error('Error loading availability dates:', error);
          this.dateRangeErrors.push('Error loading available dates');
        },
      });
  }

  private async checkAvailability(): Promise<void> {
    if (!this.selectedDateRange.startDate || !this.selectedDateRange.endDate) {
      return;
    }

    try {
      const response = await this.availabilityService
        .checkAvailabilityOfListing(
          this.listingId,
          this.selectedDateRange.startDate,
          this.selectedDateRange.endDate
        )
        .toPromise();

      if (!response?.isAvailable) {
        this.dateRangeErrors.push('Selected dates are not available');
        this.selectedDateRange.startDate = null;
        this.selectedDateRange.endDate = null;
      }
    } catch (error) {
      console.error('Error checking availability:', error);
      this.dateRangeErrors.push('Error checking date availability');
    }
  }

  dateFilter = (date: Date | null): boolean => {
    if (!date) return false;

    const today = new Date();
    today.setHours(0, 0, 0, 0);

    // Don't allow past dates
    if (date < today) return false;

    // Don't allow dates outside the available range
    if (this.minDate && date < this.minDate) return false;
    if (this.maxDate && date > this.maxDate) return false;

    // Check if date is reserved
    return !this.reservedDates.some(
      (reserved) =>
        reserved.getFullYear() === date.getFullYear() &&
        reserved.getMonth() === date.getMonth() &&
        reserved.getDate() === date.getDate()
    );
  };

  onDateChange(type: 'start' | 'end', event: MatDatepickerInputEvent<Date>) {
    const selectedDate = event.value;
    if (!selectedDate) return;

    if (type === 'start') {
      // If end date is before new start date, clear end date
      if (
        this.selectedDateRange.endDate &&
        selectedDate &&
        this.selectedDateRange.endDate < selectedDate
      ) {
        this.selectedDateRange.endDate = null;
      }
      this.dateRangeService.setStartDate(selectedDate);
    } else {
      this.dateRangeService.setEndDate(selectedDate);
    }

    // If we have both dates, validate them
    if (this.selectedDateRange.startDate && this.selectedDateRange.endDate) {
      this.validateDateRange();
    }
  }

  toggleGuestPopup() {
    this.isGuestPopupOpen = !this.isGuestPopupOpen;
  }

  updateGuestCount(type: keyof GuestCounts, change: number) {
    const newCount = this.guests[type] + change;
    const totalGuests =
      this.getTotalGuests() + (type !== 'infants' ? change : 0);

    if (type === 'adults') {
      if (newCount >= 1 && totalGuests <= this.maxGuests) {
        this.guests[type] = newCount;
      }
    } else if (type === 'children') {
      if (newCount >= 0 && totalGuests <= this.maxGuests) {
        this.guests[type] = newCount;
      }
    } else if (type === 'infants') {
      if (newCount >= 0 && newCount <= 5) {
        this.guests[type] = newCount;
      }
    } else if (type === 'pets') {
      if (newCount >= 0 && newCount <= 5) {
        this.guests[type] = newCount;
      }
    }
  }

  getTotalGuests(): number {
    return this.guests.adults + this.guests.children;
  }

  getGuestsText(): string {
    const total = this.getTotalGuests();
    let text = `${total} guest${total !== 1 ? 's' : ''}`;

    if (this.guests.infants > 0) {
      text += `, ${this.guests.infants} infant${
        this.guests.infants !== 1 ? 's' : ''
      }`;
    }
    if (this.guests.pets > 0) {
      text += `, ${this.guests.pets} pet${this.guests.pets !== 1 ? 's' : ''}`;
    }
    return text;
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: Event) {
    if (this.isGuestPopupOpen) {
      const target = event.target as HTMLElement;
      if (
        !target.closest('.guest-popup') &&
        !target.closest('.guest-trigger')
      ) {
        this.isGuestPopupOpen = false;
      }
    }
  }

  private formatDate(date: Date): string {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');
    const day = String(date.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  }

  async reserveNow() {
    if (!this.selectedDateRange.startDate || !this.selectedDateRange.endDate) {
      this.dateRangeErrors = [
        'Please select your check-in and check-out dates',
      ];
      return;
    }

    if (this.getTotalGuests() === 0) {
      this.dateRangeErrors = ['Please add at least one guest'];
      return;
    }

    if (this.getTotalGuests() > this.maxGuests) {
      this.dateRangeErrors = [
        `This property can accommodate a maximum of ${this.maxGuests} guest${
          this.maxGuests > 1 ? 's' : ''
        }`,
      ];
      return;
    }

    const bookingRequest = {
      listingId: this.listingId,
      checkInDate: this.formatDate(this.selectedDateRange.startDate),
      checkOutDate: this.formatDate(this.selectedDateRange.endDate),
      guestsCount: this.getTotalGuests(),
      specialRequests: '',
    };

    this.bookingService.createBooking(bookingRequest).subscribe({
      next: (booking) => {
        console.log('Booking created successfully:', booking);
        this.router.navigate(['/payment'], {
          queryParams: { bookingId: booking.id },
        });
        // Create checkout session after successful booking
        // const paymentRequest = {
        //   paymentType: 0,
        //   paymentMethodId: 1
        // };

        // this.paymentService.createCheckoutSession(booking.id, paymentRequest).subscribe({
        //   next: (response) => {
        //     window.location.href = response.url;
        //   },
        //   error: (error) => {
        //     console.error('Error creating payment session:', error);
        //     this.dateRangeErrors = ['Failed to initialize payment. Please try again.'];
        //   }
        // });
      },
      error: (error) => {
        console.error('Error creating booking:', error);

        if (error.status === 401) {
          this.dateRangeErrors = [
            'Please log in or create an account to make a reservation',
          ];
          // this.router.navigate(['/login'], {
          //   queryParams: {
          //     returnUrl: window.location.pathname,
          //     message: 'Please log in to continue with your reservation',
          //   },
          // });
          return;
        }

        if (error.error?.includes('not available')) {
          this.dateRangeErrors = [
            'Sorry, these dates are no longer available. Please try different dates.',
          ];
          this.selectedDateRange = {
            startDate: null,
            endDate: null,
          };
          this.dateRangeService.clearDateRange();
        } else if (error instanceof Error) {
          this.dateRangeErrors = [error.message];
        } else if (error.error && typeof error.error === 'string') {
          this.dateRangeErrors = [error.error];
        } else if (error.message) {
          this.dateRangeErrors = [error.message];
        } else {
          this.dateRangeErrors = [
            "Sorry, we couldn't complete your booking. Please try again.",
          ];
        }
      },
    });
  }
}
