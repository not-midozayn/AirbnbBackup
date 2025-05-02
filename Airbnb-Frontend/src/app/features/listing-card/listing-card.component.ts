import { CommonModule } from '@angular/common';
import {
  Component,
  effect,
  EventEmitter,
  inject,
  Input,
  OnDestroy,
  OnInit,
  Output,
} from '@angular/core';
import { Listing } from './../../core/models/Listing';
import { NavigationEnd, Router, RouterLink } from '@angular/router';
import { ImagesService } from '../../core/services/images.service';
import { ToastrModule, ToastrService } from 'ngx-toastr';
import { AuthStatusService } from '../../core/services/auth-status-service.service';
import { AvailabilityCalendarService } from '../../core/services/availability-calendar.service';
import { filter, Subject, takeUntil } from 'rxjs';
import { AuthService } from '../../core/services/auth.service';
import { ModalService } from '../../core/services/modal.service';

@Component({
  selector: 'app-listing-card',
  standalone: true,
  imports: [CommonModule, RouterLink],
  templateUrl: './listing-card.component.html',
  styleUrls: ['./listing-card.component.css'],
})
export class ListingCardComponent implements OnInit, OnDestroy {
  public destroyed = new Subject<any>();
  constructor(
    public imgsService: ImagesService,
    public router: Router,
    private _ToastrService: ToastrService,
    private authStatusService: AuthStatusService,
    public _AvailabilityCalendarService: AvailabilityCalendarService,
    public _AuthService: AuthService,
    private _loginModalService: ModalService
  ) {
    // effect(() => {
    //   const isLoggedIn = this.authStatusService.isLoggedInSignal();
    //   if (isLoggedIn) {
    //     // لو حصل login
    //     // this.reloadToken();  // أو أي فانكشن انت عايزها
    //     this.token = localStorage.getItem('accessToken');
    //   }
    // });
  }

  ngOnInit(): void {
    this.router.events
      .pipe(
        filter((event: any) => event instanceof NavigationEnd),
        takeUntil(this.destroyed)
      )
      .subscribe(() => {
        // this.display = false;
      });
    this._AuthService.isLoggedInSubject
      .asObservable()
      .subscribe((isLoggedIn) => {
        if (isLoggedIn) {
          this.token = localStorage.getItem('accessToken');
          console.log(this.token);
        } else {
          this.token = null; // أو أي قيمة افتراضية أخرى
        }
      });
  }

  ngOnDestroy(): void {
    this.destroyed.next(1);
    this.destroyed.complete();
  }

  token: any;
  @Input() listingItem: Listing = {} as Listing;
  hover: boolean = false;
  currentImageIndex = 0;
  images: string[] = [
    'https://dq5r178u4t83b.cloudfront.net/wp-content/uploads/sites/125/2020/06/15182916/Sofitel-Dubai-Wafi-Luxury-Room-Bedroom-Skyline-View-Image1_WEB.jpg',
    'https://www.usatoday.com/gcdn/authoring/authoring-images/2024/05/26/USAT/73865433007-tempoby-hilton-nashville-standard-king.jpg',
    'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg',
  ];
  Wishlist: number[] = [];

  // ... الكود الحالي ...
  @Input() isFavorite: boolean = false;
  @Output() toggleWishList = new EventEmitter<string>();
  Router: any;

  toggleFavorite(event: Event) {
    this.token = localStorage.getItem('accessToken');
    if (this.token) {
      event.preventDefault(); // إضافة هذه السطر لمنع السلوك الافتراضي
      event.stopPropagation(); // لمنع انتشار الحدث
      this.isFavorite = !this.isFavorite;
      this.toggleWishList.emit(this.listingItem.id);
      console.log('Favorite status:', this.isFavorite); // للتأكد من أن الدالة تعمل
    } else {
      this.isFavorite = this.isFavorite;
      // this._ToastrService.info('you should LogIn First', 'Attention');
      this._loginModalService.openLoginModal();
      console.log('you must login');
      event.preventDefault();
      event.stopPropagation();
    }
  }

  nextImage() {
    if (this.currentImageIndex < this.images.length - 1) {
      this.currentImageIndex++;
    }
  }

  prevImage() {
    if (this.currentImageIndex > 0) {
      this.currentImageIndex--;
    }
  }

  getFormattedDate(): string {
    // console.log(this.listingItem.createdAt)
    const apiDate = this.listingItem.createdAt;
    const dateObj = new Date(apiDate);

    const year = dateObj.getFullYear();
    const month = dateObj.getMonth();
    const day = dateObj.getDate();

    const startDate = new Date(year, month, day); // June 14
    const endDate = new Date(year, month, day); // June 17

    const options: Intl.DateTimeFormatOptions = {
      month: 'short',
      day: 'numeric',
    };

    const startDateStr = startDate.toLocaleDateString('en-US', options);
    const endDateStr = endDate.toLocaleDateString('en-US', options);

    return `${startDateStr}-${endDateStr}`;
  }
}
