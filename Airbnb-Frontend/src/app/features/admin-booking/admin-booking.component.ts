import { Component } from '@angular/core';
 import { UserBookingService } from '../../core/services/user-booking.service';
 import { UserBookingsComponent } from './../../shared/components/user-bookings/user-bookings.component';

 @Component({
   selector: 'app-admin-bookings',
   imports: [UserBookingsComponent],
   templateUrl: './admin-booking.component.html',
   styleUrl: './admin-booking.component.css'
 })
 export class AdminBookingsComponent {
   constructor(private userBookingService: UserBookingService) { }

   myBookingApi = () => this.userBookingService.getAllBookings();
 }
