import { Component, Inject, OnInit } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { UserBookingService } from '../../core/services/user-booking.service';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatDialogModule } from '@angular/material/dialog'; // Add this import

@Component({
  selector: 'app-booking-cancellation',
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    MatButtonModule,
    MatInputModule,
    MatFormFieldModule,
    MatIconModule,
    MatDialogModule,
  ],
  templateUrl: './booking-cancellation.component.html',
  styleUrls: ['./booking-cancellation.component.css'],
})
export class BookingCancellationComponent implements OnInit {
  cancellationReason: string = '';
  isLoading: boolean = false;
  cancellationPolicy: string = '';
  refundAmount: number = 0;

  constructor(
    public dialogRef: MatDialogRef<BookingCancellationComponent>,
    @Inject(MAT_DIALOG_DATA)
    public data: {
      bookingId: string;
      checkInDate: Date;
      totalPrice: number;
    },
    private userBookingService: UserBookingService,
    private snackBar: MatSnackBar
  ) {}

  ngOnInit() {
    this.loadCancellationPolicy();
    this.calculateRefund();
  }

  loadCancellationPolicy() {
    this.userBookingService
      .getCancellationPolicy(this.data.bookingId)
      .subscribe({
        next: (policy) => {
          console.log('Policy received from API:', policy); // <-- Add this
          if (policy) {
            this.cancellationPolicy = `
             • ${policy.name}
             • ${policy.description}
           `;
          } else {
            this.cancellationPolicy = 'No policy available';
          }
        },
        error: (err) => {
          console.error('Error fetching policy:', err);
          this.cancellationPolicy = 'Standard cancellation policy applies';
        },
      });
  }

  calculateRefund() {
    this.userBookingService
      .calculateRefundAmount(this.data.bookingId)
      .subscribe({
        next: (amount) => {
          console.log('Refund amount received:', amount); // <-- Add this
          this.refundAmount = amount;
        },
        error: (err) => {
          console.error('Error calculating refund:', err);
          this.snackBar.open('Error calculating refund amount', 'Close', {
            duration: 3000,
          });
        },
      });
  }

  proceedWithCancellation() {
    if (!this.cancellationReason.trim()) {
      this.snackBar.open('Please enter a cancellation reason', 'Close', {
        duration: 3000,
      });
      return;
    }

    this.isLoading = true;
    this.userBookingService
      .cancelBooking(this.data.bookingId, this.cancellationReason)
      .subscribe({
        next: () => {
          this.dialogRef.close('cancelled');
        },
        error: () => {
          this.isLoading = false;
          this.dialogRef.close('error');
        },
      });
  }
}
