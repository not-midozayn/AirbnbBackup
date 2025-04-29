import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-payment-failed',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="flex flex-col items-center justify-center min-h-screen bg-gray-100">
      <div class="p-8 bg-white shadow-lg rounded-lg text-center">
        <div class="text-red-500 mb-4">
          <svg class="w-16 h-16 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
          </svg>
        </div>
        <h1 class="text-2xl font-bold mb-4">Payment Failed</h1>
        <p class="text-gray-600 mb-6">Sorry, there was a problem processing your payment.</p>
        <div class="space-y-4">
          <button (click)="tryAgain()" class="bg-rose-500 text-white px-6 py-2 rounded-lg hover:bg-rose-600 w-full">
            Try Again
          </button>
          <button (click)="goHome()" class="border border-gray-300 text-gray-700 px-6 py-2 rounded-lg hover:bg-gray-50 w-full">
            Return to Home
          </button>
        </div>
      </div>
    </div>
  `,
})
export class PaymentFailedComponent {
  constructor(private router: Router) {}

  tryAgain() {
    // Navigate back to the previous page
    window.history.back();
  }

  goHome() {
    this.router.navigate(['/home']);
  }
}