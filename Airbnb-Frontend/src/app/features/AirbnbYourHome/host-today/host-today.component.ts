import { Component } from '@angular/core';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-host-today',
  imports: [],
  templateUrl: './host-today.component.html',
  styleUrl: './host-today.component.css'
})
export class HostTodayComponent {
  constructor(public authService: AuthService) { }

}
