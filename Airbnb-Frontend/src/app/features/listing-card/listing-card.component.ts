

import { CommonModule } from '@angular/common';
import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Listing } from './../../core/models/Listing';
import { RouterLink } from '@angular/router';
import { Toast, ToastModule } from 'primeng/toast';
import { ImagesService } from '../../core/services/images.service';


@Component({
  selector: 'app-listing-card',
  standalone: true,
  imports:[CommonModule , RouterLink ,Toast,ToastModule ],
  templateUrl: './listing-card.component.html',
  styleUrls: ['./listing-card.component.css']
})
export class ListingCardComponent {
  constructor(public imgsService: ImagesService) { }
  
  @Input() listingItem: Listing = {} as Listing;
  hover: boolean = false;
  currentImageIndex = 0;
  images: string[]=
  [
    'https://dq5r178u4t83b.cloudfront.net/wp-content/uploads/sites/125/2020/06/15182916/Sofitel-Dubai-Wafi-Luxury-Room-Bedroom-Skyline-View-Image1_WEB.jpg',
    'https://www.usatoday.com/gcdn/authoring/authoring-images/2024/05/26/USAT/73865433007-tempoby-hilton-nashville-standard-king.jpg',
    'https://www.usatoday.com/gcdn/-mm-/05b227ad5b8ad4e9dcb53af4f31d7fbdb7fa901b/c=0-64-2119-1259/local/-/media/USATODAY/USATODAY/2014/08/13/1407953244000-177513283.jpg'
  ];
  Wishlist:number[] = [];

    // ... الكود الحالي ...
  @Input() isFavorite: boolean = false;
  @Output() toggleWishList = new EventEmitter<string>();
  Router: any;

  toggleFavorite(event: Event) {
    event.preventDefault(); // إضافة هذه السطر لمنع السلوك الافتراضي
    event.stopPropagation(); // لمنع انتشار الحدث
    this.isFavorite = !this.isFavorite;
    this.toggleWishList.emit(this.listingItem.id);
    console.log('Favorite status:', this.isFavorite); // للتأكد من أن الدالة تعمل
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

  // Format the date as "jun 14-17"
  getFormattedDate(): string {
    // console.log(this.listingItem.createdAt)
    const apiDate=this.listingItem.createdAt;
    const dateObj = new Date(apiDate);

    const year=dateObj.getFullYear();
    const month=dateObj.getMonth();
    const day=dateObj.getDate();

    const startDate = new Date(year, month, day); // June 14
    const endDate = new Date(year, month, day); // June 17

    const options: Intl.DateTimeFormatOptions = { month: 'short', day: 'numeric' };

    const startDateStr = startDate.toLocaleDateString('en-US', options);
    const endDateStr = endDate.toLocaleDateString('en-US', options);

    return `${startDateStr}-${endDateStr}`;
  }



}


