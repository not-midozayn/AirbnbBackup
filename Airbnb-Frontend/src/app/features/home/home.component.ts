import { Component, EventEmitter, inject, Input, Output, signal } from '@angular/core';
import { ListingCardComponent } from '../listing-card/listing-card.component';
import { Listing } from './../../core/models/Listing';
import { Subscription } from 'rxjs';
import { ListingsService } from '../../core/services/listings.service';
import { PropertyTypeService } from '../../core/services/property-type.service';
import { CarouselBasicDemo } from "../property-type/property-type.component";
import { Router } from '@angular/router';
import { WishlistService } from '../../core/services/wishlist.service';
import { ChatBotComponent } from '../chat-bot/chat-bot.component';
// import { ToastModule } from 'primeng/toast';
// import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-home',
  standalone:true,
    imports: [ListingCardComponent, CarouselBasicDemo, ChatBotComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
  })
export class HomeComponent {
  constructor(private listingsService: ListingsService , private router:Router) {}
  private readonly _propertyTypeService = inject(PropertyTypeService);
  private readonly _wishListService = inject(WishlistService)
  // toastService = inject(ToastrService)

  listingItems: Listing[] = [];
  filteredListings: Listing[] = [] as Listing[];
  wishList:string[] = [];
  loading = false;
  error: string | null = null;
  private subscription: Subscription | null = null;




  ngOnInit() {
    this.loading = true;

this._propertyTypeService.getAllPropertyTypes().subscribe({
  next:(p)=>{
    console.log(p);
  },
  error:(err)=>{
    console.error(err);
  }
});


    this.subscription = this.listingsService.getListings().subscribe({
      next: (data) => {
        this.filteredListings = data;
        this.listingItems = data;
        this.loading = false;
      },
      error: (err) => {
        this.error = 'Failed to load listings';
        this.loading = false;
      }
    });


    this._wishListService.getAllWishlists().subscribe({
      next:(wishes)=>{
        console.log(wishes);
        this.wishList =  wishes.wishlistItems.map((item: any) => item.listingId);
      },
      error:(err)=>{
        console.error(err);
      }
    });

  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
  }


  filterListings(propertyTypeId: string) {
    this.listingItems = this.filteredListings.filter(
      (listing) => listing.propertyTypeId === propertyTypeId
    );
    console.log(this.filteredListings);
  }

  isInWishlist(listingId:string):boolean{
      return this.wishList.includes(listingId)
  }

  toggleFavorite(listingId:string){
    if(!this.isInWishlist(listingId)){
      this._wishListService.Addwish(listingId).subscribe(
        ()=>{ this.wishList.push(listingId);
          // this.toastService.success("Added to wishlist" , "Success" , {timeOut: 2000});

        }
        
        ,
      )
    } else{
      this._wishListService.RemoveWish(listingId).subscribe(
        ()=>{this.wishList= this.wishList.filter((item)=> item !== listingId)}
      )
    }
  }

}
