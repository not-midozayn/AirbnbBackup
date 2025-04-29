import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class ReservationService {
  private apiUrl = environment.apiUrl
;

  constructor(private http: HttpClient) { }
  getBookingDetails(bookingId: string): Observable<any> {

    return this.http.get(`${this.apiUrl}/bookings/${bookingId}`);
  }

  confirmPayment(bookingId: string, paymentData: any): Observable<any> {
    return this.http.post(`${this.apiUrl}/bookings/${bookingId}/pay`, paymentData);
  }
}
