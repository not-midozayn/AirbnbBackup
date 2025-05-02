// account.component.ts
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';

interface AccountCard {
  icon: string;
  title: string;
  description: string;
  routerLink: string;
}

@Component({
  selector: 'app-account',
  standalone: true,
  imports: [CommonModule, RouterModule],
  templateUrl: './account-settings.component.html',
  styleUrls: ['./account-settings.component.css']
})
export class AccountComponent {
  userName = 'John Hany';
  userEmail = 'hanyjohn2001@gmail.com';

  accountCards: AccountCard[] = [
    {
      icon: 'id-card',
      title: 'Personal info',
      description: 'Provide personal details and how we can reach you',
      routerLink: '/Account/personal-info'
    } ,
  {
    icon: 'id-card',
    title: 'Reservations',
    description: 'MyReservations',
    routerLink: '/Account/MyReservtions'
  },];

  getIconClass(icon: string): string {
    return `icon-${icon}`;
  }
}
