import { Component, OnInit, ViewChild } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DashboardHeaderComponent } from "../dashboard-header/dashboard-header.component";
import { DashboardSideMenuComponent } from "../dashboard-side-menu/dashboard-side-menu.component";
import { UsersDashboardComponent } from "../users-dashboard/users-dashboard.component";
import { ListingsDashboardComponent } from "../listings-dashboard/listings-dashboard.component";
import { AnalyticsDashboardComponent } from "../analytics-dashboard/analytics-dashboard.component";
import { AdminBookingsComponent } from '../admin-booking/admin-booking.component';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    CommonModule,
    DashboardHeaderComponent,
    DashboardSideMenuComponent,
    UsersDashboardComponent,
    ListingsDashboardComponent,
    AnalyticsDashboardComponent,
    AdminBookingsComponent
  ],
  templateUrl: './dashboard.component.html',
  styleUrl: './dashboard.component.css'
})
export class DashboardComponent implements OnInit {
  @ViewChild('sideMenu') sideMenu!: DashboardSideMenuComponent;

  ngOnInit() {}

  toggleSideMenu() {
    if (this.sideMenu) {
      this.sideMenu.toggleMenu();
    }
  }
}
