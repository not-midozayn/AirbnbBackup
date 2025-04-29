export interface Host {
  id: string;
  firstName: string;
  lastName: string;
  profilePictureUrl: string;
  bio: string;
  isHost: boolean;
  isVerified: boolean;
}

export interface CancellationPolicy {
  id: number;
  name: string;
  description: string;
  fullRefundDays: number | null;
  partialRefundDays: number | null;
  partialRefundPercentage: number | null;
}

// export interface Review {
//   id: string;
//   text: string;
//   guestId: string;
//   guestName: string;
//   guestPhoto: string;
//   createdAt: string;
//   cleanlinessRating: number;
//   accuracyRating: number;
//   communicationRating: number;
//   locationRating: number;
//   startDateRating: number;
//   valueRating: number;
// }

export interface Listing {
  id: string;
  host: Host;
  title: string;
  description: string;
  propertyTypeId: string;
  roomTypeId: number;
  capacity: number;
  bedrooms: number;
  bathrooms: number;
  pricePerNight: number;
  serviceFee: number;
  addressLine1: string;
  addressLine2: string;
  city: string;
  state: string;
  country: string;
  postalCode: string;
  latitude: number;
  longitude: number;
  instantBooking: boolean;
  createdAt: string; // You can use `Date` if you're parsing it
  updatedAt: string;
  minNights: number;
  maxNights: number;
  cancellationPolicy: CancellationPolicy;
  averageRating: number;
  reviewCount: number;
  isActive: boolean;
  currencyId: number;
  verificationStatusId: number;
  imageUrls: string[];
  previewImageUrl: string;
  amenities: any[]; // You can replace `any` with a specific `Amenity` type if available
  reviews: any[];
}
