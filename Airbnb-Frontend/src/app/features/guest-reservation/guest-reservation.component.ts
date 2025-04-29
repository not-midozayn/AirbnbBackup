import { Component } from '@angular/core';
import { UserBookingService } from '../../core/services/user-booking.service';
import { UserBookingsComponent } from './../../shared/components/user-bookings/user-bookings.component';

@Component({
  selector: 'app-guest-reservations',
  imports: [UserBookingsComponent],
  templateUrl: './guest-reservation.component.html',
  styleUrl: './guest-reservation.component.css'
})
export class GuestReservationsComponent {
  constructor(private userBookingService: UserBookingService) { }
  myBookingApi = () => this.userBookingService.getCurrentUserBookings();
}
