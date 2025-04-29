import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class DateRangeService {
  private startDateSubject = new BehaviorSubject<Date | null>(null);
  private endDateSubject = new BehaviorSubject<Date | null>(null);

  startDate$ = this.startDateSubject.asObservable();
  endDate$ = this.endDateSubject.asObservable();

  setStartDate(date: Date | null) {
    this.startDateSubject.next(date);
  }

  setEndDate(date: Date | null) {
    this.endDateSubject.next(date);
  }

  getCurrentDateRange() {
    return {
      startDate: this.startDateSubject.value,
      endDate: this.endDateSubject.value
    };
  }

  clearDateRange() {
    this.startDateSubject.next(null);
    this.endDateSubject.next(null);
  }
}
