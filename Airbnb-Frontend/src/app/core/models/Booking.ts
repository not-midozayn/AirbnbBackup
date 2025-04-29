export interface Booking {
  id: string;
  guestId: string;
  listingId: string;
  checkInDate: string; // Or use Date if you're working with Date objects
  checkOutDate: string;
  guestsCount: number;
  totalPrice: number;
  status: string;
  bookingDate: string;
  updatedAt: string;
  specialRequests: string;
  cancellationReason: string;
  paymentIntentId: string;
}

export interface BookingRequest {
  listingId: string;
  checkInDate: string | Date;
  checkOutDate: string | Date;
  guestsCount: number;
  specialRequests?: string;
}

export interface BookingDate {
  start: Date;
  end: Date;
  isAvailable: boolean;
}
