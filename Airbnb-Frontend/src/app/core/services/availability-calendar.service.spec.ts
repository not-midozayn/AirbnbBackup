import { TestBed } from '@angular/core/testing';

import { AvailabilityCalendarService } from './availability-calendar.service';

describe('AvailabilityCalendarService', () => {
  let service: AvailabilityCalendarService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AvailabilityCalendarService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
