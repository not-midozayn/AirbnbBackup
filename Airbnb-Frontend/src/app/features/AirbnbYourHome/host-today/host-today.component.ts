import { Component } from '@angular/core';
import { UserBookingService } from '../../../core/services/user-booking.service';
import { UserBookingsComponent } from '../../../shared/components/user-bookings/user-bookings.component';

@Component({
  selector: 'app-host-today',
  imports: [UserBookingsComponent],
  templateUrl: './host-today.component.html',
  styleUrls: ['./host-today.component.css']
})
export class HostTodayComponent {

  constructor(private userBookingService: UserBookingService) { }

  myBookingApi = () => this.userBookingService.getHostBookings();
}
