import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AvailabilityCalendar } from '../models/AvailabilityCalendar';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

interface HasAvailabilityResponse {
  listingId: string;
  hasAvailability: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class AvailabilityCalendarService {
  private apiUrl = 'https://localhost:7200/api';

  constructor(private http: HttpClient) { }

  setAvailabilityCalendar(listingId: string, availabilityCalendar: AvailabilityCalendar) {
    return this.http.post<AvailabilityCalendar>(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}`, availabilityCalendar);
  }

  getAvailabilityCalendarOfListing(listingId: string): Observable<AvailabilityCalendar[]> {
    return this.http.get<AvailabilityCalendar[]>(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}`);
  }

  getListingDateRange(listingId: string) {
    return this.getAvailabilityCalendarOfListing(listingId).pipe(
      map(dates => {
        if (dates.length === 0) return null;
        const sortedDates = dates.sort((a, b) => new Date(a.date).getTime() - new Date(b.date).getTime());
        return {
          startDate: new Date(sortedDates[0].date),
          endDate: new Date(sortedDates[sortedDates.length - 1].date)
        };
      })
    );
  }

  getAvailabilityCalendarOfListingOfDate(listingId: string, date: Date) {
    const formattedDate = date.toISOString().split('T')[0];
    return this.http.get<AvailabilityCalendar>(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/date/${formattedDate}`);
  }

  checkAvailabilityOfListing(listingId: string, startDate: Date, endDate: Date) {
    const formattedStartDate = startDate.toISOString().split('T')[0];
    const formattedEndDate = endDate.toISOString().split('T')[0];
    return this.http.get<{ listingId: string, isAvailable: boolean }>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/isavailable?startDate=${formattedStartDate}&endDate=${formattedEndDate}`
    );
  }

  checkAvailabilityOfListingEmpty(listingId: string) {
    return this.http.get<HasAvailabilityResponse>(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/has-availability`);
  }

  updateAvailabilityCalendarOfListingOfDate(listingId: string, date: Date, updatedData: { isAvailable: boolean, specialPrice?: number }) {
    const formattedDate = date.toISOString().split('T')[0];
    return this.http.put(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/date/${formattedDate}`, updatedData);
  }

  initializeAvailability(listingId: string, monthsAhead: number = 3) {
    return this.http.post(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/init`, {
      monthsAhead,
      isAvailable: true
    });
  }

  resetAvailability(listingId: string) {
    return this.initializeAvailability(listingId, 3);
  }

  setAvailabilityCalendarBatch(listingId: string, dateRanges: Array<{ startDate: Date, endDate: Date, isAvailable: boolean, specialPrice?: number }>) {
    // Format the date ranges for the backend
    const formattedRanges = dateRanges.map(range => ({
      startDate: range.startDate.toISOString().split('T')[0],
      endDate: range.endDate.toISOString().split('T')[0],
      isAvailable: range.isAvailable,
      specialPrice: range.specialPrice
    }));

    return this.http.post<any[]>(`${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/batch`, formattedRanges);
  }
}
