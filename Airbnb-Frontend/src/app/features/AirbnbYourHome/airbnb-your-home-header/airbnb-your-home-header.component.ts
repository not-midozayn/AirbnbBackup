import { CommonModule } from '@angular/common';
import { Component, HostListener, OnInit } from '@angular/core';
import { Router, RouterLink, RouterLinkActive } from '@angular/router';
import { NavigationService, NavItem } from '../../../core/services/navigation.service';
import { AuthService } from '../../../core/services/auth.service';
import { ModalService } from '../../../core/services/modal.service';
import { RegisterModalService } from '../../../core/services/register-modal.service';

@Component({
  selector: 'app-airbnb-your-home-header',
  standalone: true,
  imports: [RouterLink, RouterLinkActive, CommonModule],
  templateUrl: './airbnb-your-home-header.component.html',
  styleUrl: './airbnb-your-home-header.component.css'
})
export class AirbnbYourHomeHeaderComponent implements OnInit {
  isMobileMenuOpen = false;
  isUserMenuOpen = false;
  navItems: NavItem[] = [];

  constructor(private navigationService: NavigationService, private router: Router, public authService: AuthService, private modalService: ModalService, private registerModalService: RegisterModalService) { }

  ngOnInit() {
    this.navigationService.navItems$.subscribe(items => {
      this.navItems = items;
    });
  }

  goHome() {
    this.router.navigateByUrl('/Account', { skipLocationChange: true }).then(() => {
      this.router.navigate(['/home']);
    });
  }

  openLoginModal() {
    this.modalService.openLoginModal();
    this.isUserMenuOpen = false;
  }
  openRegisterModal() {
    this.registerModalService.openRegisterModal();
    this.isUserMenuOpen = false;
  }
  logout() {
    this.router.navigateByUrl('/home');
    this.authService.logout();
  }
  toggleUserMenu(event: Event): void {
    event.stopPropagation();
    this.isUserMenuOpen = !this.isUserMenuOpen;
  }
  toggleMobileMenu() {
    this.isMobileMenuOpen = !this.isMobileMenuOpen;
  }
  @HostListener('document:click')
  closeMenus(): void {
    if (!this.isMobileMenuOpen) {
      this.isUserMenuOpen = false;
    }
  }

}
