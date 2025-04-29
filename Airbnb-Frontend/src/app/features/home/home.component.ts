import { Component,effect,  EventEmitter, inject, Input, Output, signal } from '@angular/core';
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
import { ToastModule } from 'primeng/toast';
 import { ToastrService } from 'ngx-toastr';
 import { SearchComponent } from "../search/search.component";
 import { SearchService } from '../../core/services/search.service';
 import { InfiniteScrollModule } from 'ngx-infinite-scroll';
 import { ScrollService } from '../../core/services/scroll-service.service';
 import { AuthStatusService } from '../../core/services/auth-status-service.service';

@Component({
  selector: 'app-home',
  standalone:true,
    imports: [ListingCardComponent, CarouselBasicDemo, ChatBotComponent , SearchComponent , InfiniteScrollModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
  })
export class HomeComponent {
  constructor(private listingsService: ListingsService , private router:Router ,  private searchService: SearchService , private _ScrollService:ScrollService , private authStatusService:AuthStatusService) {
 
    // effect(() => {
    //   const isLoggedIn = this.authStatusService.isLoggedInSignal();
    //   if (isLoggedIn) {
    //     // لو حصل login
    //     // this.reloadToken();  // أو أي فانكشن انت عايزها
    //     window.location.reload();
    //   }
    // });

  }
  private readonly _propertyTypeService = inject(PropertyTypeService);
  private readonly _wishListService = inject(WishlistService)
  toastService = inject(ToastrService)
  // toastService = inject(ToastrService)

  listingItems: Listing[] = [];
  filteredListings: Listing[] = [] as Listing[];
  wishList:string[] = [];
  loading = false;
  error: string | null = null;
  private subscription: Subscription | null = null;
  currentPage=1;
  itemsPerPage=10;
  paginationParams: { [key: string]: any } = {};
  propertyTypeParams: { [key: string]: any } = {};




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


    // this.subscription = this.listingsService.getListings().subscribe({
    //   next: (data) => {
    //     this.filteredListings = data;
    //     this.listingItems = data;
    //     this.loading = false;
    //   },
    //   error: (err) => {
    //     this.error = 'Failed to load listings';
    //     this.loading = false;
    //   }
    // });


    this._wishListService.getAllWishlists().subscribe({
      next:(wishes)=>{
        console.log(wishes);
        this.wishList =  wishes.wishlistItems.map((item: any) => item.listingId);
      },
      error:(err)=>{
        console.error(err);
      }
    });



    this.searchService.searchParams$.subscribe(params =>{
      this.loadListings(params);
    })
    
    
    
    this.loadListings( {"pageNumber":1});

  }

  ngOnDestroy() {
    this.subscription?.unsubscribe();
  }




 loadListings(queryParams: {[key:string]:any} = {}) {
  this.loading = true;
  this.subscription = this.listingsService.getListings(queryParams).subscribe({
    next: (data) => {
      this.listingItems = data;
      this.loading = false;
    },
    error: (err) => {
      this.error = 'Failed to load listings';
      this.loading = false;
    }
  })
  // ,
  // this.listingsService.getListings().subscribe({
  //   next:(data)=>{
  //     this.filteredListings=data;
  //     this.filteredListings=this.filteredListings.filter((listing) => listing.verificationStatusId === 3)
  //   },
  //   error: (err) => {
  //     this.error = 'Failed to load listings';
  //     this.loading = false;
  //   }
  // })
  }



  appendData=()=>{
    this.listingsService.getListings(this.paginationParams={pageNumber:this.currentPage}).subscribe({
     next: (data) => {
       this.listingItems = [...this.listingItems,...data];
       
     },
     error: (err) => {
       this.error = 'Failed to pagination';
       this.loading = false;
     }
   })

 }




 onScroll(){
  if(this._ScrollService.getScrollState()){
  this.currentPage++;
  console.log(this.currentPage)
  this.appendData();
  }
}


filterListings(propertyTypeId: string) {
  this._ScrollService.stopScroll();
  this.currentPage = 1;
  const params = {
    PropertyTypeId: propertyTypeId
  };
  this.paginationParams = params;
  this.listingItems = []; // امسح اللي موجود
  this.loadListings(params);
}


  isInWishlist(listingId:string):boolean{
      return this.wishList.includes(listingId)
  }

  toggleFavorite(listingId:string){
    if(!this.isInWishlist(listingId)){
      this._wishListService.Addwish(listingId).subscribe(
        ()=>{ this.wishList.push(listingId);
          // this.toastService.success("Added to wishlist" , "Success" , {timeOut: 2000});
          this.toastService.success("Added to wishlist" , "Success" , {timeOut: 2000});

        }
        
        ,
      )
    } else{
      this._wishListService.RemoveWish(listingId).subscribe(
        ()=>{this.wishList= this.wishList.filter((item)=> item !== listingId)}
      )
      this.toastService.error("Removed from wishlist" , "Delete" , {timeOut: 2000});
    }
  }

}
