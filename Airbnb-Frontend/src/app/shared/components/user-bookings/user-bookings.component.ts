import { Component, OnInit, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../../core/services/auth.service';
import { UserBookingService } from '../../../core/services/user-booking.service';
import { Booking2 } from '../../../core/models/Booking';
import { Observable } from 'rxjs';
import { BookingCancellationComponent } from '../../../features/booking-cancellation/booking-cancellation.component';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { MatButtonModule } from '@angular/material/button';

@Component({
  selector: 'app-user-bookings',
  standalone: true,
  imports: [CommonModule, FormsModule, MatButtonModule],
  templateUrl: './user-bookings.component.html',
  styleUrl: './user-bookings.component.css'
})
export class UserBookingsComponent implements OnInit {
  @Input() fetchBookingsFunction!: (status?:string) => Observable<Booking2[]>;
  @Input() showCancelButton: boolean = true;
  @Input() showHostData: boolean = true;
  @Input() AllowPagination: boolean = true;
  @Input() paginationEnabled: boolean = true;
  @Input() showGuestData: boolean = true;
  // Add these properties to your component class
  currentPage: number = 1;
  itemsPerPage: number = 5; // You can adjust this number
  totalItems: number = 0;
  visiblePageLimit: number = 5; // Sh
  today = new Date();
  bookings: Booking2[] = [];
  filteredBookings: Booking2[] = [];

  // Search
  searchQuery: string = '';

  // Status filters
  statusFilters = [
    { value: 'all', label: 'All' },
    { value: 'Confirmed', label: 'Confirmed' },
    { value: 'Pending', label: 'Pending' },
    { value: 'Cancelled', label: 'Cancelled' }
  ];
  activeStatusFilter: string = 'all';

  bookingTabs = [
    { value: 'upcoming', label: 'Upcoming' },
    { value: 'current', label: 'Current' },
    { value: 'completed', label: 'Completed' }
  ];
  activeTab: string = 'upcoming';

  // Sort options
  sortOptions = [
    { value: 'newest', label: 'Newest First' },
    { value: 'oldest', label: 'Oldest First' },
    { value: 'priceHigh', label: 'Price (High to Low)' },
    { value: 'priceLow', label: 'Price (Low to High)' },
    { value: 'checkIn', label: 'Check-in Date' }
  ];
  activeSort: string = 'newest';

  isLoading: boolean = false;
  error: string | null = null;

  constructor(
    public authService: AuthService,
    private userBookingService: UserBookingService,
    private dialog: MatDialog, // Add dialog service
    private snackBar: MatSnackBar // Add snackbar service
  ) { }

  ngOnInit() {
    this.fetchBookings();
  }
  fetchBookings() {
    this.isLoading = true;
    this.error = null;

    this.fetchBookingsFunction('').subscribe({
      next: (data) => {
        this.bookings = data;
        this.applyFilters(); // Apply filters after data is fetched
        this.isLoading = false;
      },
      error: (err) => {
        this.error = 'Failed to load bookings. Please try again later.';
        this.isLoading = false;
        console.error('Error fetching bookings:', err);
      }
    });
  }
  applyFilters() {
    let results = [...this.bookings];
    if (this.activeStatusFilter !== 'all') {
      results = results.filter(booking => booking.status === this.activeStatusFilter);
    }
        // Apply tab filter only when status is Confirmed
        if (this.activeStatusFilter === 'Confirmed') {
          const today = this.today
          today.setHours(0, 0, 0, 0);

          switch (this.activeTab) {
            case 'upcoming':
              results = results.filter(booking =>
                new Date(booking.checkInDate) > today
              );
              break;
            case 'current':
              results = results.filter(booking => {
                const checkIn = new Date(booking.checkInDate);
                const checkOut = new Date(booking.checkOutDate);
                return checkIn <= today && checkOut >= today;
              });
              break;
            case 'completed':
              results = results.filter(booking =>
                new Date(booking.checkOutDate) < today
              );
              break;
          }
        }
    // Apply search filter
    if (this.searchQuery) {
      const query = this.searchQuery.toLowerCase();
      results = results.filter(booking =>
        (booking.listing?.title?.toLowerCase().includes(query) ?? false) ||
        `${booking.listing?.city ?? ''}, ${booking.listing?.state ?? ''}, ${booking.listing?.country ?? ''}`.toLowerCase().includes(query) ||
        `${booking.listing?.host?.firstName ?? ''} ${booking.listing?.host?.lastName ?? ''}`.toLowerCase().includes(query)
      );
    }
    // Apply sorting
    const sortedBookings = this.sortBookings(results);

    // Update total items count
    this.totalItems = sortedBookings.length;;

    if (this.paginationEnabled) {
      const startIndex = (this.currentPage - 1) * this.itemsPerPage;
      this.filteredBookings = sortedBookings.slice(startIndex, startIndex + this.itemsPerPage);
    } else {
      this.filteredBookings = sortedBookings;
    }
  }
  sortBookings(bookings: Booking2[]): Booking2[] {
    switch (this.activeSort) {
      case 'newest':
        return [...bookings].sort((a, b) =>
          new Date(b.bookingDate).getTime() - new Date(a.bookingDate).getTime()
        );
      case 'oldest':
        return [...bookings].sort((a, b) =>
          new Date(a.bookingDate).getTime() - new Date(b.bookingDate).getTime()
        );
      case 'priceHigh':
        return [...bookings].sort((a, b) => b.totalPrice - a.totalPrice);
      case 'priceLow':
        return [...bookings].sort((a, b) => a.totalPrice - b.totalPrice);
      case 'checkIn':
        return [...bookings].sort((a, b) =>
          new Date(a.checkInDate).getTime() - new Date(b.checkInDate).getTime()
        );
      default:
        return bookings;
    }
  }
  onSortChange() {
    this.applyFilters(); // Re-apply filters to already loaded data
  }
  setActiveTab(tab: string) {
    this.activeTab = tab;
    this.applyFilters();
  }
  toggleStatusFilter(status: string) {
    this.activeStatusFilter = status;
    this.currentPage = 1; // Reset to first page when changing status filter
    if (status === 'Confirmed') {
      this.activeTab = 'upcoming';
    }// Fetch new data when status changes
    this.applyFilters(); // Re-apply filters to already loaded data
  }

  resetFilters() {
    this.searchQuery = '';
    this.activeStatusFilter = 'all';
    this.activeSort = 'newest';
    this.activeTab = 'upcoming';
    this.currentPage = 1; // Reset to first page when resetting filters
    this.applyFilters();
  }

  getNightCount(checkInDate: string, checkOutDate: string): number {
    const start = new Date(checkInDate);
    const end = new Date(checkOutDate);
    return Math.ceil((end.getTime() - start.getTime()) / (1000 * 60 * 60 * 24));
  }

  cancelBooking(booking: Booking2) {
    const dialogRef = this.dialog.open(BookingCancellationComponent, {
      width: '500px',
      data: {
        bookingId: booking.id,
        checkInDate: new Date(booking.checkInDate),
        totalPrice: booking.totalPrice
      },
      disableClose: true // Prevent closing by clicking outside
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result === 'cancelled') {
        this.snackBar.open('Booking cancelled successfully', 'Close', {
          duration: 3000,
          panelClass: ['success-snackbar']
        });
        this.fetchBookings(); // Refresh the list
      } else if (result === 'error') {
        this.snackBar.open('Failed to cancel booking', 'Close', {
          duration: 3000,
          panelClass: ['error-snackbar']
        });
      }
    });
  }

  get visiblePages(): (number | string)[] {
    const pages: (number | string)[] = [];
    const total = this.totalPages;
    const current = this.currentPage;
    const limit = this.visiblePageLimit;

    if (total <= limit + 2) {
      // Show all pages if not too many
      for (let i = 1; i <= total; i++) pages.push(i);
    } else {
      // Smart pagination with ellipsis
      if (current <= limit - 1) {
        // Near the start
        for (let i = 1; i <= limit; i++) pages.push(i);
        pages.push('...');
        pages.push(total);
      } else if (current >= total - limit + 2) {
        // Near the end
        pages.push(1);
        pages.push('...');
        for (let i = total - limit + 1; i <= total; i++) pages.push(i);
      } else {
        // In the middle
        pages.push(1);
        pages.push('...');
        const start = Math.max(2, current - Math.floor(limit / 2));
        const end = Math.min(total - 1, current + Math.floor(limit / 2));
        for (let i = start; i <= end; i++) pages.push(i);
        pages.push('...');
        pages.push(total);
      }
    }

    return pages;
  }
  viewBookingDetails(bookingId: string) {
    // Implement view details logic
  }
  onPageChange(page: number|string): void {
    if (page === '...' || page === this.currentPage) return;
    this.currentPage = Number(page);
    this.applyFilters();
    window.scrollTo({ top: 0, behavior: 'smooth' }); // Smooth scroll to top
  }


  get totalPages(): number {
    return Math.ceil(this.totalItems / this.itemsPerPage);
  }

  get pages(): number[] {
    const pages = [];
    for (let i = 1; i <= this.totalPages; i++) {
      pages.push(i);
    }
    return pages;
  }
  isComingCheckInDate(checkInDate: string): boolean {
    return new Date(checkInDate) > this.today;
  }
}
