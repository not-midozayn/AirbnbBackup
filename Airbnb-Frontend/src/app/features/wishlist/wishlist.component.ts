import { Component, OnInit } from '@angular/core';
import { ListingCardComponent } from '../listing-card/listing-card.component';
import { Listing } from '../../core/models/Listing';
import { WishlistService } from '../../core/services/wishlist.service';
import { ListingsService } from '../../core/services/listings.service';
import { CommonModule } from '@angular/common';


@Component({
  selector: 'app-wishlist',
  imports: [CommonModule,ListingCardComponent],
  templateUrl: './wishlist.component.html',
  styleUrl: './wishlist.component.css'
})
export class WishlistComponent implements OnInit {

wishlistIds:string[]=[];
wishlistListings:Listing[]=[];

constructor(private _WishlistService:WishlistService , private _ListingsService:ListingsService ){

}
  ngOnInit(): void {
    this.fetchWishlist();
  }

  fetchWishlist(){
    this._WishlistService.getAllWishlists().subscribe({
      next:(ids:any)=>{
        this.wishlistIds=ids.wishlistItems.map((item: any) => item.listingId);

        this._ListingsService.getListings().subscribe({
          next:(listings:Listing[])=>{

            console.log("wishlistids" ,  this.wishlistIds);


            this.wishlistListings=listings.filter(l => this.wishlistIds.includes(l.id));
            console.log( "wishlistings" ,this.wishlistListings);
          }
          ,
          error:()=>{
            console.log("failed to load listings")
          }
        })
      },
      error:()=>{
        console.log("failed to load wishlist")
      }
    })
  }

  isInWishlist(id:string):boolean{
    return this.wishlistIds.includes(id);
  }

  removeFromWishlist(id:string):void{
    console.log("Toggle called for:", id);
    if(this.isInWishlist(id)){
      this._WishlistService.RemoveWish(id).subscribe(()=>{
        this.wishlistIds=this.wishlistIds.filter(x => x !== id);
        this.wishlistListings=this.wishlistListings.filter(x => x.id !== id)
        console.log("Removed from wishlist:", id);
      }
      )}
  }



}
