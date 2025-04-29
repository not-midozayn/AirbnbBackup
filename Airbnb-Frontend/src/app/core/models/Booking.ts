import { Host } from "./user";
import { Listing } from "./Listing";

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
export interface Booking2 {
  id: string;
  guest: Host;
  listing: Listing;
  checkInDate: string;
  checkOutDate: string;
  guestsCount: number;
  totalPrice: number;
  status: string;
  bookingDate: string;
  updatedAt: string | null;
  specialRequests: string;
  cancellationReason: string;
  paymentIntentId: string | null;
  listingImageUrl: string | null; // For the image URL to display
  listingName: string; // For the listing name to display in the template
  location: string; // A formatted location string to display
  bookingCode: string; // For the booking ID to display in the template
  createdAt: string; // For the date the booking was made, to display in the template
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
