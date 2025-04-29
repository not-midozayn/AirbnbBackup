import { Component, HostListener, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { AvailabilityCalendarService } from '../../core/services/availability-calendar.service';
import { DateRangePickerComponent } from '../date-range-picker/date-range-picker.component';
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
    ReactiveFormsModule,
    DateRangePickerComponent,
    MatDatepickerModule,
    MatFormFieldModule,
    MatNativeDateModule,
    MatInputModule
  ],
  templateUrl: './reservation-card.component.html',
  styleUrl: './reservation-card.component.css'
})
export class ReservationCardComponent implements OnInit {
  @Input() listingId!: string;

  isGuestPopupOpen: boolean = false;
  reservedDates: Date[] = [];
  dateRangeErrors: string[] = [];
  listing?: Listing;
  priceBreakdown: PriceBreakdown = {
    nightlyRate: 0,
    nights: 0,
    subtotal: 0,
    serviceFee: 0,
    totalAmount: 0
  };

  guests: GuestCounts = {
    adults: 1,
    children: 0,
    infants: 0,
    pets: 0
  };

  maxGuests: number = 1; // Default to 1 until we load the listing
  selectedDateRange: { startDate: Date | null; endDate: Date | null } = {
    startDate: null,
    endDate: null
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
      this.loadAvailableDates();
      this.setupDateRangeSubscription();
      this.loadListingDetails();
    }
  }

  private loadListingDetails() {
    this.listingsService.getListingById(this.listingId).subscribe({
      next: (listing) => {
        this.listing = listing;
        this.maxGuests = listing.capacity; // Set maxGuests from listing capacity
        this.priceBreakdown.nightlyRate = listing.pricePerNight;
        this.priceBreakdown.serviceFee = listing.serviceFee;
        this.updatePriceCalculation();
      },
      error: (error) => {
        console.error('Error loading listing details:', error);
      }
    });
  }

  private updatePriceCalculation() {
    if (this.selectedDateRange.startDate && this.selectedDateRange.endDate && this.listing) {
      const nights = Math.ceil(
        (this.selectedDateRange.endDate.getTime() - this.selectedDateRange.startDate.getTime()) /
        (1000 * 60 * 60 * 24)
      );

      this.priceBreakdown.nights = nights;
      this.priceBreakdown.subtotal = this.priceBreakdown.nightlyRate * nights;
      this.priceBreakdown.totalAmount =
        this.priceBreakdown.subtotal +
        this.priceBreakdown.serviceFee;
    }
  }

  private setupDateRangeSubscription() {
    this.dateRangeService.startDate$.subscribe(date => {
      if (date) {
        this.selectedDateRange.startDate = date;
        this.validateDateRange();
      }
    });

    this.dateRangeService.endDate$.subscribe(date => {
      if (date) {
        this.selectedDateRange.endDate = date;
        this.validateDateRange();
      }
    });
  }

  private validateDateRange() {
    this.dateRangeErrors = [];
    if (this.selectedDateRange.startDate && this.selectedDateRange.endDate) {
      this.checkAvailability().then(() => {
        if (this.dateRangeErrors.length === 0) {
          this.updatePriceCalculation();
        }
      });
    }
  }

  private loadAvailableDates() {
    this.availabilityService.getAvailabilityCalendarOfListing(this.listingId).subscribe({
      next: (dates) => {
        // Filter only unavailable dates
        this.reservedDates = dates
          .filter(date => !date.isAvailable)
          .map(date => new Date(date.date));
      },
      error: (error) => {
        console.error('Error loading availability dates:', error);
        this.dateRangeErrors.push('Error loading available dates');
      }
    });
  }

  private async checkAvailability(): Promise<void> {
    if (!this.selectedDateRange.startDate || !this.selectedDateRange.endDate) {
      return;
    }

    try {
      const response = await this.availabilityService.checkAvailabilityOfListing(
        this.listingId,
        this.selectedDateRange.startDate,
        this.selectedDateRange.endDate
      ).toPromise();

      if (!response?.isAvailable) {
        this.dateRangeErrors.push('Selected dates are not available');
        this.dateRangeService.setStartDate(null);
        this.dateRangeService.setEndDate(null);
      }
    } catch (error) {
      console.error('Error checking availability:', error);
      this.dateRangeErrors.push('Error checking date availability');
    }
  }

  onDateRangeSelected(event: { startDate: Date, endDate: Date }) {
    this.selectedDateRange = {
      startDate: event.startDate,
      endDate: event.endDate
    };
    this.validateDateRange();
  }

  toggleGuestPopup() {
    this.isGuestPopupOpen = !this.isGuestPopupOpen;
  }

  updateGuestCount(type: keyof GuestCounts, change: number) {
    const newCount = this.guests[type] + change;
    const totalGuests = this.getTotalGuests() + (type !== 'infants' ? change : 0);

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
      text += `, ${this.guests.infants} infant${this.guests.infants !== 1 ? 's' : ''}`;
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
      if (!target.closest('.guest-popup') && !target.closest('.guest-trigger')) {
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
      this.dateRangeErrors = ['Please select check-in and check-out dates'];
      return;
    }

    if (this.getTotalGuests() === 0) {
      this.dateRangeErrors = ['Please select at least one guest'];
      return;
    }

    if (this.getTotalGuests() > this.maxGuests) {
      this.dateRangeErrors = [`Maximum ${this.maxGuests} guests allowed`];
      return;
    }

    const bookingRequest = {
      listingId: this.listingId,
      checkInDate: this.formatDate(this.selectedDateRange.startDate),
      checkOutDate: this.formatDate(this.selectedDateRange.endDate),
      guestsCount: this.getTotalGuests(),
      specialRequests: ''
    };

    console.log('Attempting to create booking:', bookingRequest);

    this.bookingService.createBooking(bookingRequest).subscribe({
      next: (booking) => {
        console.log('Booking created successfully:', booking);
        
        // Create checkout session after successful booking
        const paymentRequest = {
          paymentType: 0, // Default payment type
          paymentMethodId: 1 // Default payment method
        };

        this.paymentService.createCheckoutSession(booking.id, paymentRequest).subscribe({
          next: (response) => {
            // Redirect to Stripe checkout URL
            window.location.href = response.url;
          },
          error: (error) => {
            console.error('Error creating payment session:', error);
            this.dateRangeErrors = ['Failed to initialize payment. Please try again.'];
          }
        });
      },
      error: (error) => {
        console.error('Error creating booking:', error);
        if (error instanceof Error) {
          this.dateRangeErrors = [error.message];
        } else if (error.error && typeof error.error === 'string') {
          this.dateRangeErrors = [error.error];
        } else if (error.message) {
          this.dateRangeErrors = [error.message];
        } else {
          this.dateRangeErrors = ['Failed to create booking. Please try again.'];
        }

        // Reset date selection if dates are not available
        if (error.message?.includes('not available') || error.error?.includes('not available')) {
          this.dateRangeService.setStartDate(null);
          this.dateRangeService.setEndDate(null);
          this.selectedDateRange = {
            startDate: null,
            endDate: null
          };
        }
      }
    });
  }
}
