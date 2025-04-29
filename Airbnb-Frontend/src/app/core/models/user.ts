export interface Country {
  name?: string;
  code?: string;
}

export interface Representative {
  name?: string;
  image?: string;
}

export interface User {
  firstName: string;
  lastName: string;
  dateOfBirth: string;
  profilePictureUrl: string | null;
  createdAt: string | null;
  updatedAt: string | null;
  bio: string | null;
  isHost: boolean | null;
  isVerified: boolean;
  verificationStatusId: number;
  isAdmin: boolean | null;
  lastLogin: string | null;
  preferredLanguage: string ;
  currencyId: number | null;
  bookings: any | null;
  currency: any | null;
  listings: any | null;
  messageRecipients: any[];
  messageSenders: any[];
  payments: any[];
  reviewHosts: any[];
  reviewReviewers: any | null;
  verificationStatus: any | null;
  wishlists: any | null;
  id: string;
  userName: string;
  normalizedUserName: string;
  email: string;
  normalizedEmail: string;
  emailConfirmed: boolean;
  passwordHash: string;
  securityStamp: string;
  concurrencyStamp: string;
  phoneNumber: string ;
  phoneNumberConfirmed: boolean;
  twoFactorEnabled: boolean;
  lockoutEnd: string | null;
  lockoutEnabled: boolean;
  accessFailedCount: number;
  currentPassword:string;
  newPassword:string;
  confirmPassword:string;
}
