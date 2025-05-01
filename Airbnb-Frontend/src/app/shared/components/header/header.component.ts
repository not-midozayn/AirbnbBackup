import { CommonModule } from '@angular/common';
import {
  Component,
  effect,
  HostListener,
  inject,
  SimpleChange,
  ViewChild,
} from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router, RouterLink, RouterModule } from '@angular/router';
import { ModalService } from '../../../core/services/modal.service';
import { RegisterModalService } from '../../../core/services/register-modal.service';
import { AuthService } from '../../../core/services/auth.service';
import { UserService } from '../../../core/services/user.service';
import { User } from '../../../core/models/user';
import { SearchComponent } from '../../../features/search/search.component';
import { SearchService } from '../../../core/services/search.service';
import { PersonalInfoComponent } from '../../../features/personal-info/personal-info.component';
import { PersonalInfoService } from '../../../core/services/personal-info.service';
import { ImagesService } from '../../../core/services/images.service';
import { ResponseUser } from '../../../core/models/responseUser';
import { ScrollService } from '../../../core/services/scroll-service.service';
import { DateRangePickerComponent } from '../../../features/date-range-picker/date-range-picker.component';
import { HomeComponent } from '../../../features/home/home.component';
import { AppComponent } from '../../../app.component';

interface GuestCount {
  adults: number;
  children: number;
  infants: number;
  pets: number;
  [key: string]: number;
}

interface GuestType {
  key: keyof GuestCount;
  label: string;
  description: string;
  minValue: number;
  maxValue: number;
}

interface SearchParams {
  location: string;
  checkIn: string;
  checkOut: string;
  guests: string;
}

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [CommonModule, RouterModule, FormsModule, SearchComponent],
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css'],
})
export class HeaderComponent {
  constructor(
    private modalService: ModalService,
    private registerModalService: RegisterModalService,
    public authService: AuthService,
    private router: Router,
    private searchService: SearchService,
    public _PersonalInfoService: PersonalInfoService,
    public _ImagesService: ImagesService,
    private _ScrollService: ScrollService,
    public _AppComponent: AppComponent
  ) {}
  isUserMenuOpen = false;
  isGuestMenuOpen = false;
  isMobileSearchOpen = false;
  showMobileGuestMenu = false;
  isLoading = false;
  guestText = 'Add guests';
  guests: GuestCount = {
    adults: 0,
    children: 0,
    infants: 0,
    pets: 0,
  };
  guestTypes: GuestType[] = [
    {
      key: 'adults',
      label: 'Adults',
      description: 'Ages 13 or above',
      minValue: 1,
      maxValue: 16,
    },
    {
      key: 'children',
      label: 'Children',
      description: 'Ages 2–12',
      minValue: 0,
      maxValue: 16,
    },
    {
      key: 'infants',
      label: 'Infants',
      description: 'Under 2',
      minValue: 0,
      maxValue: 5,
    },
    {
      key: 'pets',
      label: 'Pets',
      description: 'Bringing an assistance animal?',
      minValue: 0,
      maxValue: 5,
    },
  ];
  searchParams: SearchParams = {
    location: '',
    checkIn: '',
    checkOut: '',
    guests: 'Add guests',
  };

  profilePictureUrl: string | null = null;
  currentUser: User | ResponseUser | null | undefined = undefined;

  @ViewChild(SearchComponent) SearchComponent!: SearchComponent;
  clearSearch() {
    if (this.SearchComponent) {
      this.SearchComponent.clearInputs();
    }
  }

  isProfilePictureAvailable(): any {
    return localStorage.getItem('accessToken');
  }

  isHomeUrl(): boolean {
    return this.router.url === '/home';
  }

  ngOnInit() {
    this.authService.loginStatus$.subscribe((isLoggedIn) => {
      if (isLoggedIn) {
        this.getProfilePicture();
      }
      // ngOnInit(): void {
      //   this.authService.loginStatus$.subscribe((isLoggedIn) => {
      //     if (isLoggedIn) {
      //       this.getProfilePicture();
      //     }
      //   });
      // }


    });
    this._PersonalInfoService.profilePictureUpdated$.subscribe((updated) => {
      if (updated) {
        this.getProfilePicture();
      }
    // this.getProfilePicture();
  })
}

  // ngOnChanges(changes: SimpleChange) {
  //     this.getProfilePicture();
  // }

  public getProfilePicture() {
    this._PersonalInfoService.getMyPersonalInfo().subscribe(
      (response) => {
        // لو فيه صورة موجودة
        if (response.profilePictureUrl) {
          this.profilePictureUrl = this._ImagesService.getImageUrl(
            response.profilePictureUrl
          );
        } else {
          // لو مفيش صورة
          this.profilePictureUrl = null;
        }
      },
      (error) => {
        console.error('Error loading profile picture', error);
        this.profilePictureUrl = null; // لو فيه مشكلة في التحميل، هنخليها null
      }
    );
    this.isUserMenuOpen = false;
  }

  onSearch(data: any) {
    this.searchService.emitSearchParams(data);
  }

  openLoginModal() {
    this.modalService.openLoginModal();
    this.isGuestMenuOpen = false;
    this.isMobileSearchOpen = false;
    this.isUserMenuOpen = false;
    this.clearSearch();
  }
  openRegisterModal() {
    this.registerModalService.openRegisterModal();
    this.isGuestMenuOpen = false;
    this.isMobileSearchOpen = false;
    this.isUserMenuOpen = false;
  }
  logout() {
    this.router.navigateByUrl('/home');
    this.authService.logout();
    this._AppComponent.homeComponent.wishList = [];
    this.authService.isLoggedIn = false;
    this.authService.isLoggedInSubject.next(false);
  }
  becomeAHost() {
    this.isLoading = true;
    this.authService.becomeAHost().subscribe({
      next: () => {
        this.isLoading = false;
      },
      error: (error) => {
        console.log('Error updating user:', error.error.message);
        this.isLoading = false;
      },
    });
  }
  isHost(): boolean {
    const roles = this.authService.getAccessTokenClaim('roles');
    return roles.includes('Host');
  }
  isAdmin(): boolean {
    const roles = this.authService.getAccessTokenClaim('roles');
    return roles.includes('Admin');
  }

  showGuestMenuInMobile(): void {
    this.showMobileGuestMenu = true;
    this.isGuestMenuOpen = true; // This is for the desktop version
  }

  hideGuestMenuInMobile(): void {
    this.showMobileGuestMenu = false;
    this.isGuestMenuOpen = false;
  }

  toggleUserMenu(event: Event): void {
    event.stopPropagation();
    this.isUserMenuOpen = !this.isUserMenuOpen;
    this.isGuestMenuOpen = false;
    this.isMobileSearchOpen = false;
  }

  toggleGuestMenu(event: Event): void {
    event.stopPropagation();
    if (this.isMobileSearchOpen) {
      this.showGuestMenuInMobile();
    } else {
      this.isGuestMenuOpen = !this.isGuestMenuOpen;
    }
    this.isUserMenuOpen = false;
  }

  openMobileSearch(event?: Event): void {
    if (event) event.stopPropagation();
    this.isMobileSearchOpen = true;
    this.isUserMenuOpen = false;
    this.isGuestMenuOpen = false;
  }

  closeMobileSearch(): void {
    this.isMobileSearchOpen = false;
    this.showMobileGuestMenu = false;
    this.isGuestMenuOpen = false;
  }

  @HostListener('document:click')
  closeMenus(): void {
    if (!this.isMobileSearchOpen || !this.isGuestMenuOpen) {
      this.isUserMenuOpen = false;
      this.isGuestMenuOpen = false;
    }
  }

  @HostListener('click', ['$event'])
  onClick(event: Event): void {
    const target = event.target as HTMLElement;
    if (
      !target.closest('.mobile-search-content') &&
      this.isMobileSearchOpen &&
      !this.isGuestMenuOpen
    ) {
      this.closeMobileSearch();
    }
    event.stopPropagation();
  }

  getTotalPeople(): number {
    return this.guests.adults + this.guests.children;
  }

  updateGuestText(): void {
    const parts = [];
    const totalPeople = this.getTotalPeople();

    if (totalPeople > 0) {
      parts.push(`${totalPeople} ${totalPeople === 1 ? 'guest' : 'guests'}`);
    } else {
      parts.push('Add guests');
    }

    if (this.guests.infants > 0) {
      parts.push(
        `${this.guests.infants} ${
          this.guests.infants === 1 ? 'infant' : 'infants'
        }`
      );
    }

    if (this.guests.pets > 0) {
      parts.push(
        `${this.guests.pets} ${this.guests.pets === 1 ? 'pet' : 'pets'}`
      );
    }

    this.guestText = parts.join(' · ');
    this.searchParams.guests = this.guestText;
  }

  isDecrementDisabled(type: keyof GuestCount): boolean {
    const guestType = this.guestTypes.find((t) => t.key === type);
    return guestType ? this.guests[type] <= guestType.minValue : true;
  }

  isIncrementDisabled(type: keyof GuestCount): boolean {
    if (type === 'adults' || type === 'children') {
      return this.getTotalPeople() >= 16;
    }
    const guestType = this.guestTypes.find((t) => t.key === type);
    return guestType ? this.guests[type] >= guestType.maxValue : true;
  }

  updateGuests(type: keyof GuestCount, change: number): void {
    const guestType = this.guestTypes.find((t) => t.key === type);
    if (!guestType) return;

    const newValue = this.guests[type] + change;

    if (type === 'adults' || type === 'children') {
      const wouldExceedLimit =
        (type === 'adults' ? newValue : this.guests.adults) +
          (type === 'children' ? newValue : this.guests.children) >
        16;

      if (!wouldExceedLimit && newValue >= guestType.minValue) {
        this.guests[type] = newValue;
      }
    } else {
      this.guests[type] = Math.min(
        Math.max(guestType.minValue, newValue),
        guestType.maxValue
      );
    }

    this.updateGuestText();
  }

  openDatePicker(type: 'checkIn' | 'checkOut'): void {
    // In a real app, implement a proper date picker here
    const date = prompt(`Enter ${type} date (YYYY-MM-DD):`);
    if (date) {
      this.searchParams[type] = date;
    }
  }

  performSearch(): void {
    // Implement your search logic here
    console.log('Searching with:', this.searchParams);
    this.closeMobileSearch();
    this.resetSearchParams();
  }
  resetGuests(): void {
    this.guests = {
      adults: 0,
      children: 0,
      infants: 0,
      pets: 0,
    };
    this.guestText = 'Add guests';
    this.searchParams.guests = this.guestText;
  }
  resetSearchParams(): void {
    this.searchParams = {
      location: '',
      checkIn: '',
      checkOut: '',
      guests: 'Add guests',
    };
    this.resetGuests();
  }

  modifiedLoc: string = '';
  modifiedStartDate: string = '';
  modifiedEndDate: string = '';
  modifiedGuests: number = 0;
  goHome() {
    this.clearSearch();
    if(this.SearchComponent){
      this.SearchComponent.dateRangePicker.clearDateRange();
    }
    this._ScrollService.startScroll();
    this.router
      .navigateByUrl('/Account', { skipLocationChange: true })
      .then(() => {
        this.router.navigate(['/home']);
      });
    console.log('Home clicked');
  }
}
