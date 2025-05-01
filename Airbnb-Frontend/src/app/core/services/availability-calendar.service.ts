import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { AvailabilityCalendar } from '../models/AvailabilityCalendar';
import { map, switchMap } from 'rxjs/operators';
import { Observable, of } from 'rxjs';

interface HasAvailabilityResponse {
  listingId: string;
  hasAvailability: boolean;
}

@Injectable({
  providedIn: 'root',
})
export class AvailabilityCalendarService {
  private apiUrl = 'https://localhost:7200/api';

  constructor(private http: HttpClient) {}

  private normalizeDate(date: Date): string {
    const utcDate = new Date(Date.UTC(date.getFullYear(), date.getMonth(), date.getDate()));
    return utcDate.toISOString().split('T')[0];
  }

  setAvailabilityCalendar(
    listingId: string,
    availabilityCalendar: AvailabilityCalendar
  ) {
    const normalized = {
      ...availabilityCalendar,
      date: this.normalizeDate(new Date(availabilityCalendar.date))
    };
    return this.http.post<AvailabilityCalendar>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}`,
      normalized
    );
  }

  getAvailabilityCalendarOfListing(
    listingId: string
  ): Observable<AvailabilityCalendar[]> {
    return this.http.get<AvailabilityCalendar[]>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}`
    );
  }

  getListingDateRange(listingId: string) {
    return this.checkAvailabilityOfListingEmpty(listingId).pipe(
      switchMap((response: HasAvailabilityResponse) => {
        if (!response.hasAvailability) return of(null);

        return this.getAvailabilityCalendarOfListing(listingId).pipe(
          map((dates) => {
            if (!dates || dates.length === 0) return null;

            // Filter only available dates
            const availableDates = dates.filter(d => d.isAvailable);
            if (availableDates.length === 0) return null;

            const sortedDates = availableDates.sort(
              (a, b) => new Date(a.date).getTime() - new Date(b.date).getTime()
            );

            return {
              startDate: new Date(sortedDates[0].date),
              endDate: new Date(sortedDates[sortedDates.length - 1].date),
            };
          })
        );
      })
    );
  }

  getAvailabilityCalendarOfListingOfDate(listingId: string, date: Date) {
    const formattedDate = this.normalizeDate(date);
    return this.http.get<AvailabilityCalendar>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/date/${formattedDate}`
    );
  }

  checkAvailabilityOfListing(
    listingId: string,
    startDate: Date,
    endDate: Date
  ) {
    const formattedStartDate = this.normalizeDate(startDate);
    const formattedEndDate = this.normalizeDate(endDate);
    return this.http.get<{ listingId: string; isAvailable: boolean }>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/isavailable?startDate=${formattedStartDate}&endDate=${formattedEndDate}`
    );
  }

  checkAvailabilityOfListingEmpty(listingId: string) {
    return this.http.get<HasAvailabilityResponse>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/has-availability`
    );
  }

  updateAvailabilityCalendarOfListingOfDate(
    listingId: string,
    date: Date,
    updatedData: { isAvailable: boolean; specialPrice?: number }
  ) {
    const formattedDate = this.normalizeDate(date);
    return this.http.put(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/date/${formattedDate}`,
      updatedData
    );
  }

  initializeAvailability(listingId: string, monthsAhead: number = 3) {
    return this.http.post(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/init`,
      {
        monthsAhead,
        isAvailable: true,
      }
    );
  }

  resetAvailability(listingId: string) {
    return this.initializeAvailability(listingId, 3);
  }

  setAvailabilityCalendarBatch(
    listingId: string,
    dateRanges: Array<{
      startDate: Date;
      endDate: Date;
      isAvailable: boolean;
      specialPrice?: number;
    }>
  ) {
    const formattedRanges = dateRanges.map((range) => ({
      startDate: this.normalizeDate(range.startDate),
      endDate: this.normalizeDate(range.endDate),
      isAvailable: range.isAvailable,
      specialPrice: range.specialPrice,
    }));

    return this.http.post<any[]>(
      `${this.apiUrl}/AvailabilityCalendar/listings/${listingId}/batch`,
      formattedRanges
    );
  }

  getAvailabilityOfListingsIfExists(
    listingId: string
  ): Observable<AvailabilityCalendar[] | null> {
    return this.checkAvailabilityOfListingEmpty(listingId).pipe(
      switchMap((response: HasAvailabilityResponse) => {
        if (response.hasAvailability) {
          return this.getAvailabilityCalendarOfListing(listingId);
        }
        return of(null);
      })
    );
  }
}
