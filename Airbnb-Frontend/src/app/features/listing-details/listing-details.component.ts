import { Listing } from './../../core/models/Listing';
import {
  AfterViewInit,
  ChangeDetectorRef,
  Component,
  inject,
  Input,
  OnDestroy,
  OnInit,
} from '@angular/core';
import { ListingsService } from '../../core/services/listings.service';
import { Subscription } from 'rxjs';
import { GalleriaModule } from 'primeng/galleria';
import { DividerModule } from 'primeng/divider';
import { ButtonModule } from 'primeng/button';
import { ProgressBarModule } from 'primeng/progressbar';
import { CommonModule } from '@angular/common';
import * as L from 'leaflet';
import { ActivatedRoute } from '@angular/router';
import { ReservationCardComponent } from '../reservation-card/reservation-card.component';


interface RatingCategory {
  name: string;
  rating: number;
}

@Component({
  selector: 'app-listing-details',
  standalone: true,
  imports: [
    CommonModule,
    GalleriaModule,
    DividerModule,
    ButtonModule,
    ProgressBarModule,
    ReservationCardComponent,
],
  templateUrl: './listing-details.component.html',
  styleUrl: './listing-details.component.css',
})
export class ListingDetailsComponent
  implements OnInit, OnDestroy, AfterViewInit
{
  constructor(
    private listingsService: ListingsService,
    private cdr: ChangeDetectorRef
  ) {}
    // unavailableDates: Date[] = [];
    // checkIn: Date | null = null;
    // checkOut: Date | null = null;

  @Input() listing: Listing = {} as Listing;
  private readonly _ActivatedRoute = inject(ActivatedRoute);
  loading: boolean = false;
  error: string | null = null;
  private subscription: Subscription | null = null;
  showAllPhotos: boolean = false;
  showAllReviews: boolean = false;
  showAllAmenities: boolean = false;
  activeImageIndex: number = 1;
  responsiveOptions!: any[];
  visibleAmenities: any[] = [];
  visibleReviews: any[] = [];
  defaultVisibleCount: number = 1;
  defaultVisibleReviewsCount: number = 4;
  ratingCategories: RatingCategory[] = [];

   ngOnInit(): void {
      this._ActivatedRoute.paramMap.subscribe({
      next: (urlData) => {
        let listingId = urlData.get('listId') as string;

        this.loading = true;
        this.subscription = this.listingsService
          .getListingById(listingId)
          .subscribe({
        next: (data) => {
              this.listing = data;
          this.updateVisibleAmenities();
          this.updateVisibleReviews();
          this.cdr.detectChanges();
              console.log(data);
              this.loading = false;
          if (this.listing && this.listing.reviews) {
            this.initializeRatings();
          }
        },
            error: () => {
              this.error = 'failed to load the details of this listing';
              this.loading = false;
            },
          });
      },
    });
        }

    ngOnDestroy(): void {
      this.subscription?.unsubscribe();
  }

  initializeRatings() {
    this.ratingCategories = [
      { name: 'Cleanliness', rating: this.clean() },
      { name: 'Accuracy', rating: this.accuracy() },
      { name: 'Check-in', rating: this.checkin() },
      { name: 'Communication', rating: this.communication() },
      { name: 'Location', rating: this.location() },
      { name: 'Value', rating: this.value() },
    ];
  }

  clean() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.cleanlinessRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

  accuracy() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.accuracyRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

  checkin() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.checkInRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

  communication() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.communicationRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

  location() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.locationRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

  value() {
    if (!this.listing?.reviews?.length) {
      return 0;
    }
    let x = 0;
    for (const review of this.listing.reviews) {
      x += review.valueRating;
    }
    return Math.ceil((x / this.listing.reviews.length) * 10) / 10;
  }

ratingToPercentage(rating: number): number {
    return (rating / 5) * 100;
}

  updateVisibleAmenities() {
  console.log('Amenities:', this.listing.amenities);
    this.visibleAmenities = this.showAllAmenities
      ? this.listing.amenities
      : this.listing.amenities.slice(0, this.defaultVisibleCount);
}

  updateVisibleReviews() {
    this.visibleReviews = this.showAllReviews
      ? this.listing.reviews
      : this.listing.reviews.slice(0, this.defaultVisibleReviewsCount);
}

toggleReviews() {
    this.showAllReviews = !this.showAllReviews;
    this.updateVisibleReviews();
}

  toggleAmenities() {
    this.showAllAmenities = !this.showAllAmenities;
    this.updateVisibleAmenities();
  }

  togglePhotos(index: number = 0) {
    this.activeImageIndex = index;
    this.showAllPhotos = !this.showAllPhotos;
  }

reserveNow() {
    // In a real app, this would send reservation data to a service
    alert('Your reservation has been confirmed!');
}

  ngAfterViewInit(): void {
    setTimeout(() => {
      this.initMap();
    }, 300);
  }
  map: any;
  initMap(): void {
    if (!document.getElementById('map')) return;
    this.map = L.map('map', {
      center: [this.listing.latitude, this.listing.longitude],
      zoom: 13,
    });

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '© OpenStreetMap contributors',
    }).addTo(this.map);

    // setTimeout(() => {
    //   this.map.invalidateSize();
    // }, 0);

    const customIcon = L.icon({
      iconUrl: 'assets/images/custom-marker.png',
      iconSize: [40, 40],
      iconAnchor: [20, 40],
      popupAnchor: [0, -35],
    });

    const marker = L.marker([this.listing.latitude, this.listing.longitude], {
      icon: customIcon,
    }).addTo(this.map);

    // const popupContent = `
    //   <div style="text-align:center;">
    //     <img src="${this.listing.imageUrls[0]}" alt="Preview" style="width:100px; height:70px; object-fit:cover; border-radius:5px; margin-bottom:5px;" />
    //     <div style="font-weight:bold;">${this.listing.title}</div>
    //   </div>
    // `;

    // marker.bindPopup(popupContent).openPopup();

    setTimeout(() => {
      this.map.invalidateSize();
    }, 500);
  }
}
