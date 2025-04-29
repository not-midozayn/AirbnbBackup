import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { loadStripe } from '@stripe/stripe-js';
import { environment } from '../../../environments/environment';

interface CheckoutSessionRequest {
  paymentType: number;
  paymentMethodId: number;
}

interface ConfirmPaymentRequest {
  paymentIntentId: string;
}

interface PaymentResponse {
  id: string;
  amount: number;
  transactionId: string;
  status: string;
  paymentDate: string;
  receiptUrl: string;
  currency: string;
  paymentMethod: string;
}

interface SessionResponse {
  paymentIntentId: string;
  bookingId: string;
  status: string;
}

@Injectable({
  providedIn: 'root'
})
export class PaymentService {
  private stripe: any;
  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) {
    this.initializeStripe();
  }

  private async initializeStripe() {
    this.stripe = await loadStripe(environment.stripePublishableKey);
  }

  createCheckoutSession(bookingId: string, request: CheckoutSessionRequest): Observable<any> {
    return this.http.post(`${this.apiUrl}/Payment/checkout-session/${bookingId}`, request);
  }

  // getSession(sessionId: string): Observable<SessionResponse> {
  //   return this.http.get<SessionResponse>(`${this.apiUrl}/Payment/session/${sessionId}`);
  // }

  // confirmPayment(bookingId: string, request: ConfirmPaymentRequest): Observable<PaymentResponse> {
  //   return this.http.post<PaymentResponse>(`${this.apiUrl}/Payment/booking/${bookingId}/confirm`, request);
  // }
}
