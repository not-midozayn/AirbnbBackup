import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatNativeDateModule } from '@angular/material/core';
import { MatInputModule } from '@angular/material/input';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { AvailabilityCalendarService } from '../../core/services/availability-calendar.service';
import { DateRangeService } from '../../core/services/date-range.service';
import { AvailabilityCalendar } from '../../core/models/AvailabilityCalendar';

@Component({
  selector: 'app-date-range-picker',
  standalone: true,
  imports: [
    CommonModule,
    MatDatepickerModule,
    MatFormFieldModule,
    MatNativeDateModule,
    MatInputModule,
    MatCheckboxModule,
    FormsModule,
    ReactiveFormsModule
  ],
  templateUrl: './date-range-picker.component.html',
  styleUrls: ['./date-range-picker.component.css']
})
export class DateRangePickerComponent implements OnInit {
  @Input() listingId!: string;
  @Input() isOwner: boolean = false;
  @Input() selectedRange?: { startDate: Date | null, endDate: Date | null };
  @Input() selectedAvailability: boolean = true;

  @Output() rangeSelected = new EventEmitter<{ startDate: Date, endDate: Date }>();
  @Output() availabilitySet = new EventEmitter<{ range: { startDate: Date, endDate: Date }, isAvailable: boolean }>();

  dateRange = new FormGroup({
    startDate: new FormControl<Date | null>(null, { validators: [Validators.required] }),
    endDate: new FormControl<Date | null>(null, { validators: [Validators.required] })
  });

  minDate = new Date();
  reservedDates: Date[] = [];
  formErrors: { [key: string]: string } = {};

  constructor(
    private availabilityService: AvailabilityCalendarService,
    private dateRangeService: DateRangeService
  ) {}

  ngOnInit() {
    if (this.listingId) {
      this.loadAvailabilityDates();
    }
    this.initializeDateRange();
    this.setupFormSubscription();
  }

  private loadAvailabilityDates() {
    this.availabilityService.getAvailabilityCalendarOfListing(this.listingId).subscribe({
      next: (dates) => {
        this.reservedDates = dates
          .filter(date => !date.isAvailable)
          .map(date => new Date(date.date));
      },
      error: (error) => {
        console.error('Error loading availability dates:', error);
      }
    });
  }

  private initializeDateRange() {
    if (this.selectedRange?.startDate || this.selectedRange?.endDate) {
      this.dateRange.patchValue({
        startDate: this.selectedRange.startDate,
        endDate: this.selectedRange.endDate
      }, { emitEvent: false });
    }
  }

  private setupFormSubscription() {
    this.dateRange.valueChanges.subscribe(range => {
      this.validateDateRange();

      if (range.startDate) {
        this.dateRangeService.setStartDate(range.startDate);
      }
      if (range.endDate) {
        this.dateRangeService.setEndDate(range.endDate);
      }

      if (range.startDate && range.endDate && !this.formErrors['dateRange']) {
        this.rangeSelected.emit({
          startDate: range.startDate,
          endDate: range.endDate
        });

        if (this.isOwner) {
          this.availabilitySet.emit({
            range: {
              startDate: range.startDate,
              endDate: range.endDate
            },
            isAvailable: this.selectedAvailability
          });
        }
      }
    });
  }

  private validateDateRange() {
    this.formErrors = {};
    const startDate = this.dateRange.get('startDate')?.value;
    const endDate = this.dateRange.get('endDate')?.value;

    if (startDate && endDate) {
      if (endDate < startDate) {
        this.formErrors['dateRange'] = 'End date cannot be earlier than start date';
        this.dateRange.setErrors({ invalidRange: true });
      } else if (this.isMaxDaysExceeded(startDate, endDate)) {
        this.formErrors['dateRange'] = 'Maximum booking duration is 90 days';
        this.dateRange.setErrors({ maxDaysExceeded: true });
      } else if (this.isPastDate(startDate)) {
        this.formErrors['dateRange'] = 'Cannot select dates in the past';
        this.dateRange.setErrors({ pastDate: true });
      } else {
        this.dateRange.setErrors(null);
      }
    }
  }

  private isMaxDaysExceeded(start: Date, end: Date): boolean {
    const diffTime = Math.abs(end.getTime() - start.getTime());
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    return diffDays > 90;
  }

  private isPastDate(date: Date): boolean {
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    return date < today;
  }

  dateFilter = (date: Date | null): boolean => {
    if (!date) return false;

    if (this.isOwner) return true; // Owner can select any date

    // For guests, filter out reserved dates
    return !this.reservedDates.some(reserved =>
      reserved.getFullYear() === date.getFullYear() &&
      reserved.getMonth() === date.getMonth() &&
      reserved.getDate() === date.getDate()
    );
  }
}
