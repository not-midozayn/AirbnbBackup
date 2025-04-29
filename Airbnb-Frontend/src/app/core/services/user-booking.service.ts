import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Booking2 } from '../models/Booking'; // Adjust the import path as necessary
import { CancellationPolicy } from '../models/Listing';

@Injectable({
  providedIn: 'root'
})
export class UserBookingService {
  private apiUrl = 'https://localhost:7200/api/booking';

  constructor(private http: HttpClient) {}

  getAllBookings(status?: string): Observable<Booking2[]> {
    let url = this.apiUrl;
    if (status) {
      url += `?Status=${status}`;
    }
    return this.http.get<Booking2[]>(url);
  }
  getCurrentUserBookings(status?: string): Observable<Booking2[]> {
    let url = this.apiUrl + '/me';
    if (status) {
      url += `?Status=${status}`;
    }
    return this.http.get<Booking2[]>(url);

  }
  getHostBookings(status?: string): Observable<Booking2[]> {
    let url = this.apiUrl + '/current-host';
    if (status) {
      url += `?Status=${status}`;
    }
    return this.http.get<Booking2[]>(url);
  }
  cancelBooking(bookingId: string, cancellationReason: string): Observable<any> {
    const url = `${this.apiUrl}/${bookingId}/cancel`;
    return this.http.post(url, { reason: cancellationReason }, {
      headers: { 'Content-Type': 'application/json' },
      responseType: 'text' as 'json'
    });
  }

  getCancellationPolicy(bookingId: string): Observable<CancellationPolicy> {
    return this.http.get<CancellationPolicy>(`${this.apiUrl}/${bookingId}/cancellation-policy`);
  }
  calculateRefundAmount(bookingId: string): Observable<number> {
    return this.http.get<number>(`${this.apiUrl}/${bookingId}/refund-amount`);

  }
}
