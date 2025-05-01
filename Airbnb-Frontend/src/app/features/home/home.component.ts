import {
  Component,
  effect,
  EventEmitter,
  inject,
  Input,
  OnDestroy,
  OnInit,
  Output,
  signal,
} from '@angular/core';
import { ListingCardComponent } from '../listing-card/listing-card.component';
import { Listing } from './../../core/models/Listing';
import { filter, Subject, Subscription, takeUntil } from 'rxjs';
import { ListingsService } from '../../core/services/listings.service';
import { PropertyTypeService } from '../../core/services/property-type.service';
import { CarouselBasicDemo } from '../property-type/property-type.component';
import { NavigationEnd, Router } from '@angular/router';
import { WishlistService } from '../../core/services/wishlist.service';
import { ChatBotComponent } from '../chat-bot/chat-bot.component';
import { ToastModule } from 'primeng/toast';
import { ToastrService } from 'ngx-toastr';
import { InfiniteScrollModule } from 'ngx-infinite-scroll';
import { ScrollService } from '../../core/services/scroll-service.service';
import { AuthStatusService } from '../../core/services/auth-status-service.service';
import { AuthService } from '../../core/services/auth.service';
import { SearchService } from '../../core/services/search.service';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [
    ListingCardComponent,
    CarouselBasicDemo,
    ChatBotComponent,
    InfiniteScrollModule,
  ],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
})
export class HomeComponent implements OnInit, OnDestroy {
  constructor(
    private listingsService: ListingsService,
    private router: Router,
    private _ScrollService: ScrollService,
    private authStatusService: AuthStatusService,
    private _propertyTypeService: PropertyTypeService,
    private authService: AuthService
  ) {}

  private readonly _wishListService = inject(WishlistService);
  private readonly _searchService = inject(SearchService);
  toastService = inject(ToastrService);

  listingItems: Listing[] = [];
  filteredListings: Listing[] = [];
  wishList: string[] = [];
  loading = false;
  error: string | null = null;
  private subscription: Subscription | null = null;
  currentPage = 1;
  itemsPerPage = 10;
  propertytypes: any[] = [];
  paginationParams: { [key: string]: any } = {};
  propertyTypeParams: { [key: string]: any } = {};
  public destroyed = new Subject<any>();
  searchParams: { [key: string]: any } = { pageNumber: 1 };

  public loadWishlist() {
    this._wishListService.getAllWishlists().subscribe({
      next: (wishes) => {
        this.wishList = wishes.wishlistItems.map((item: any) => item.listingId);
      },
      error: (err) => {
        console.error(err);
      },
    });
  }

  ngOnInit() {
    this.loading = true;
    this.router.events
      .pipe(
        filter((event: any) => event instanceof NavigationEnd),
        takeUntil(this.destroyed)
      )
      .subscribe(() => {
        // this.display = false;
      });

    // Load property types
    this._propertyTypeService.getAllPropertyTypes().subscribe({
      next: (p) => {
      },
      error: (err) => {
        console.error(err);
      },
    });

    // Load wishlists
    // this._wishListService.getAllWishlists().subscribe({
    //   next:(wishes)=>{
    //     console.log(wishes);
    //     this.wishList =  wishes.wishlistItems.map((item: any) => item.listingId);
    //   },
    //   error:(err)=>{
    //     console.error(err);
    //   }
    // });

    this.loadWishlist();

    // Subscribe to search params
    this._searchService.searchParams$.subscribe(
      (params: { [key: string]: any }) => {
        this.searchParams = params;
        this.loadListings(params);
      }
    );

    this.loadListings({ pageNumber: 1 });
  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
    this.destroyed.next(1);
    this.destroyed.complete();
  }

  loadListings(queryParams: { [key: string]: any } = {}) {
    this.loading = true;
    this.subscription = this.listingsService
      .getListings(queryParams)
      .subscribe({
        next: (data) => {
          this.listingItems = data.filter(listing => listing.verificationStatusId == 3);
          this.loading = false;
        },
        error: (err) => {
          this.error = 'Failed to load listings';
          this.loading = false;
        },
      });
  }

  appendData = () => {
    this.listingsService
      .getListings((this.paginationParams = { pageNumber: this.currentPage }))
      .subscribe({
        next: (data) => {
          let filteredData = data.filter(listing => listing.verificationStatusId == 3);
          this.listingItems = [...this.listingItems, ...filteredData];
        },
        error: (err) => {
          this.error = 'Failed to pagination';
          this.loading = false;
        },
      });
  };

  onScroll() {
    if (this._ScrollService.getScrollState()) {
      this.currentPage++;
      console.log(this.currentPage);
      this.appendData();
    }
  }

  filterListings(propertyTypeId: string) {
    this._ScrollService.stopScroll();
    this.currentPage = 1;
    const params = {
      PropertyTypeId: propertyTypeId,
    };
    this.paginationParams = params;
    this.listingItems = [];
    this.loadListings(params);
  }

  isInWishlist(listingId: string): boolean {
    return this.wishList.includes(listingId);
  }

  toggleFavorite(listingId: string) {
    if (!this.isInWishlist(listingId)) {
      this._wishListService.Addwish(listingId).subscribe(() => {
        this.wishList.push(listingId);
        this.toastService.success('Added to wishlist', 'Success', {
          timeOut: 2000,
        });
      });
    } else {
      this._wishListService.RemoveWish(listingId).subscribe(() => {
        this.wishList = this.wishList.filter((item) => item !== listingId);
      });
      this.toastService.error('Removed from wishlist', 'Delete', {
        timeOut: 2000,
      });
    }
  }
}
