// import { HttpClient } from '@angular/common/http';
// import { Injectable } from '@angular/core';
// import { Booking, BookingRequest } from '../models/Booking';
// import { AvailabilityCalendarService } from './availability-calendar.service';
// import { switchMap, tap, catchError } from 'rxjs/operators';
// import { Observable, of } from 'rxjs';

// @Injectable({
//   providedIn: 'root'
// })
// export class BookingService {
//   private apiUrl = 'https://localhost:7200/api';

//   constructor(
//     private http: HttpClient,
//     private availabilityCalendarService: AvailabilityCalendarService
//   ) { }

//   getBookingDates() {
//     return this.http.get<Booking[]>(`${this.apiUrl}/Booking`);
//   }

//   getMyBookings() {
//     return this.http.get<Booking[]>(`${this.apiUrl}/Booking/me`);
//   }

//   getBookingById(bookingId: string) {
//     return this.http.get<Booking>(`${this.apiUrl}/Booking/${bookingId}`);
//   }

//   getBookingsByListingId(listingId: string) {
//     return this.http.get<Booking[]>(`${this.apiUrl}/Booking/listings/${listingId}`);
//   }

//   getBookingsByGuestId(guestId: string) {
//     return this.http.get<Booking[]>(`${this.apiUrl}/Booking/guests/${guestId}`);
//   }

//   createBooking(bookingRequest: BookingRequest): Observable<Booking> {
//     // Format dates exactly as YYYY-MM-DD
//     const formatDate = (date: Date | string): string => {
//       if (typeof date === 'string') return date;
//       const year = date.getFullYear();
//       const month = String(date.getMonth() + 1).padStart(2, '0');
//       const day = String(date.getDate()).padStart(2, '0');
//       return `${year}-${month}-${day}`;
//     };

//     const formattedRequest = {
//       listingId: bookingRequest.listingId,
//       checkInDate: formatDate(bookingRequest.checkInDate),
//       checkOutDate: formatDate(bookingRequest.checkOutDate),
//       guestsCount: bookingRequest.guestsCount,
//       specialRequests: bookingRequest.specialRequests || ''
//     };

//     return this.availabilityCalendarService.checkAvailabilityOfListing(
//       bookingRequest.listingId,
//       bookingRequest.checkInDate instanceof Date ? bookingRequest.checkInDate : new Date(bookingRequest.checkInDate),
//       bookingRequest.checkOutDate instanceof Date ? bookingRequest.checkOutDate : new Date(bookingRequest.checkOutDate)
//     ).pipe(
//       switchMap(response => {
//         if (!response.isAvailable) {
//           throw new Error('Selected dates are not available');
//         }

//         return this.http.post<Booking>(`${this.apiUrl}/Booking`, formattedRequest)
//           .pipe(
//             catchError(error => {
//               console.error('Booking creation failed:', error);
//               if (error.status === 500 && error.error) {
//                 throw new Error(error.error);
//               }
//               throw error;
//             })
//           );
//       })
//     );
//   }

//   cancelBooking(bookingId: string) {
//     return this.http.delete(`${this.apiUrl}/Booking/${bookingId}`);
//   }

//   updateBooking(bookingId: string, booking: Partial<Booking>) {
//     return this.http.put(`${this.apiUrl}/Booking/${bookingId}`, booking);
//   }

//   makeABooking(bookingRequest: BookingRequest) {
//     return this.http.post<BookingRequest>(`${this.apiUrl}/Booking`, bookingRequest);
//   }

//   cancelBookingWithReason(bookingId: string, reason: {reason: string}) {
//     return this.http.post<{reason: string}>(`${this.apiUrl}/Booking/${bookingId}/cancel`, reason).pipe(
//       tap(() => {
//         this.getBookingById(bookingId).subscribe();
//       }),
//       catchError((error) => {
//         console.log('Error cancelling booking:', error);
//         return of(null);
//       })
//     );
//   }
// }


import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Booking, Booking2, BookingRequest } from '../models/Booking';
import { AvailabilityCalendarService } from './availability-calendar.service';
import { switchMap, tap, catchError } from 'rxjs/operators';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class BookingService {
  private apiUrl = 'https://localhost:7200/api';

  constructor(
    private http: HttpClient,
    private availabilityCalendarService: AvailabilityCalendarService
  ) { }

  getBookingDates() {
    return this.http.get<Booking[]>(`${this.apiUrl}/Booking`);
  }

  getMyBookings() {
    return this.http.get<Booking[]>(`${this.apiUrl}/Booking/me`);
  }

  getBookingById(bookingId: string) {
    return this.http.get<Booking2>(`${this.apiUrl}/Booking/${bookingId}`);
  }

  getBookingsByListingId(listingId: string) {
    return this.http.get<Booking[]>(`${this.apiUrl}/Booking/listings/${listingId}`);
  }

  getBookingsByGuestId(guestId: string) {
    return this.http.get<Booking[]>(`${this.apiUrl}/Booking/guests/${guestId}`);
  }

  createBooking(bookingRequest: BookingRequest): Observable<Booking> {
    // Format dates exactly as YYYY-MM-DD
    const formatDate = (date: Date | string): string => {
      if (typeof date === 'string') return date;
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      return `${year}-${month}-${day}`;
    };

    const formattedRequest = {
      listingId: bookingRequest.listingId,
      checkInDate: formatDate(bookingRequest.checkInDate),
      checkOutDate: formatDate(bookingRequest.checkOutDate),
      guestsCount: bookingRequest.guestsCount,
      specialRequests: bookingRequest.specialRequests || ''
    };

    return this.availabilityCalendarService.checkAvailabilityOfListing(
      bookingRequest.listingId,
      bookingRequest.checkInDate instanceof Date ? bookingRequest.checkInDate : new Date(bookingRequest.checkInDate),
      bookingRequest.checkOutDate instanceof Date ? bookingRequest.checkOutDate : new Date(bookingRequest.checkOutDate)
    ).pipe(
      switchMap(response => {
        if (!response.isAvailable) {
          throw new Error('Selected dates are not available');
        }

        return this.http.post<Booking>(`${this.apiUrl}/Booking`, formattedRequest)
          .pipe(
            catchError(error => {
              console.error('Booking creation failed:', error);
              if (error.status === 500 && error.error) {
                throw new Error(error.error);
              }
              throw error;
            })
          );
      })
    );
  }

  cancelBooking(bookingId: string) {
    return this.http.delete(`${this.apiUrl}/Booking/${bookingId}`);
  }

  updateBooking(bookingId: string, booking: Partial<Booking>) {
    return this.http.put(`${this.apiUrl}/Booking/${bookingId}`, booking);
  }

  makeABooking(bookingRequest: BookingRequest) {
    return this.http.post<BookingRequest>(`${this.apiUrl}/Booking`, bookingRequest);
  }

  cancelBookingWithReason(bookingId: string, reason: {reason: string}) {
    return this.http.post<{reason: string}>(`${this.apiUrl}/Booking/${bookingId}/cancel`, reason).pipe(
      tap(() => {
        this.getBookingById(bookingId).subscribe();
      }),
      catchError((error) => {
        console.log('Error cancelling booking:', error);
        return of(null);
      })
    );
  }
}
