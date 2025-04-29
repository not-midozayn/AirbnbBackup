import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { PaymentService } from '../../core/services/payment.service';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-payment-success',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <div class="p-8 bg-white shadow-lg rounded-lg text-center">
        <div class="text-green-500 mb-4">
          <svg class="w-16 h-16 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path>
          </svg>
        </div>
        <h1 class="text-2xl font-bold mb-4">Payment Successful!</h1>
        <p class="text-gray-600 mb-4">Your booking has been confirmed.</p>
        @if(receiptUrl) {
          <a [href]="receiptUrl" target="_blank" class="text-rose-500 hover:text-rose-600 underline block mb-6">
            View Receipt
          </a>
        }
        <button (click)="goToBookings()" class="bg-rose-500 text-white px-6 py-2 rounded-lg hover:bg-rose-600">
          View My Bookings
        </button>
      </div>
    </div>
  `,
})
export class PaymentSuccessComponent implements OnInit {
  receiptUrl: string | null = null;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private paymentService: PaymentService
  ) {}

  ngOnInit() {
    // this.route.queryParams.subscribe(params => {
    //   const sessionId = params['session_id'];
    //   if (sessionId) {
    //     this.paymentService.getSession(sessionId).subscribe({
    //       next: (session) => {
    //         if (session && session.paymentIntentId && session.bookingId) {
    //           // Confirm the payment
    //           this.paymentService.confirmPayment(session.bookingId, {
    //             paymentIntentId: session.paymentIntentId
    //           }).subscribe({
    //             next: (response) => {
    //               console.log('Payment confirmed:', response);
    //               this.receiptUrl = response.receiptUrl;
    //             },
    //             error: (error) => {
    //               console.error('Error confirming payment:', error);
    //               this.router.navigate(['/payment-failed']);
    //             }
    //           });
    //         }
    //       },
    //       error: (error) => {
    //         console.error('Error getting session:', error);
    //         this.router.navigate(['/payment-failed']);
    //       }
    //     });
    //   }
    // });
  }

  goToBookings() {
    this.router.navigate(['/bookings']);
  }
}