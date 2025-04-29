import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class WishlistService {

  constructor(private _httpClient:HttpClient) { }

  myHeaders() :any{ return { token : localStorage.getItem('accessToken')}};

  getAllWishlists():Observable<any>{
    return this._httpClient.get('https://localhost:7200/api/Wishlists' , {
      // headers: this.myHeaders
    });
  }

  Addwish(listingId:string):Observable<any>{
    return this._httpClient.post(`https://localhost:7200/api/Wishlists/add`,
      {
        "listingId":listingId
      } ,
      {
        headers: this.myHeaders()
      })
    }

  RemoveWish(listingId:string):Observable<any>{
    return this._httpClient.delete(`https://localhost:7200/api/Wishlists/${listingId}`,
      {
        headers: this.myHeaders()
      }
    )
  }

}
