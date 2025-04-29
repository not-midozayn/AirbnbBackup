export interface AvailabilityCalendar {
  id?: string;
  listingId?: string;
  date: Date;
  isAvailable: boolean | null;
  specialPrice?: number;
}
