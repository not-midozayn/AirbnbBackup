export interface NewListing {
  minNights: number;
  maxNights: number;
  cancellationPolicyId: number;
  title: string;
  description: string;
  propertyTypeId: number;
  roomTypeId: number;
  capacity: number;
  bedrooms: number;
  bathrooms: number;
  pricePerNight: number;
  securityDeposit: number;
  serviceFee: number;
  addressLine1: string;
  addressLine2: string;
  city: string;
  state: string;
  country: string;
  postalCode: string;
  instantBooking: boolean;
  latitude: number;
  longitude: number;
  currencyId: number;
  amenityIds: string[]; // assuming UUIDs as strings
}
