import { CommonModule } from '@angular/common';
import { Component } from '@angular/core';

@Component({
  selector: 'app-dashboard-side-menu',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './dashboard-side-menu.component.html',
  styleUrl: './dashboard-side-menu.component.css'
})
export class DashboardSideMenuComponent {
  isVisible: boolean = true;
  activeTab: string = 'statistics';

  toggleMenu() {
    this.isVisible = !this.isVisible;
  }

  setActiveTab(tab: string) {
    this.activeTab = tab;
  }
}
