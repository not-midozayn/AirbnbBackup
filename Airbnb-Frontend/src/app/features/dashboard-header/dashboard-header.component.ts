import { Component, EventEmitter, Output } from '@angular/core';
import { Router, RouterModule } from '@angular/router';
import { AuthService } from '../../core/services/auth.service';

@Component({
  selector: 'app-dashboard-header',
  standalone: true,
  imports: [RouterModule],
  templateUrl: './dashboard-header.component.html',
  styleUrl: './dashboard-header.component.css'
})
export class DashboardHeaderComponent {
  @Output() menuToggle = new EventEmitter<void>();
  constructor(private authService: AuthService, private router: Router) {}

  onMenuToggle() {
    this.menuToggle.emit();
  }

  logout() {
    this.authService.logout();
    this.router.navigate(['/home']);
  }
}
