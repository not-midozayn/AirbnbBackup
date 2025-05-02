import { Injectable, signal } from '@angular/core';
import { Listing } from '../models/Listing';
import { catchError, map, Observable, of, tap } from 'rxjs';
import { PropertyType } from '../models/PropertyType';
import { RoomType } from '../models/RoomType';
import { Amenity } from '../models/Amenity';
import { NewListing } from '../models/NewListing';
import { HttpClient, HttpParams } from '@angular/common/http';

interface SuggestionsDTO {
  value: string;
  type: string;
}

@Injectable({
  providedIn: 'root'
})
export class ListingsService {
  apiUrl = 'https://localhost:7200/api';
  hostListingsSignal = signal<Listing[]>([]);
  hostDraftsSignal = signal<Listing[]>([]);
  constructor(private http : HttpClient) { }


  getListings(queryParams : {[key:string]:any} = {}) {

    let params = new HttpParams();
    Object.entries(queryParams).forEach(([key,value])=>{
      if(value){
        params=params.set(key,value);
      }
    });

    return this.http.get<Listing[]>(`${this.apiUrl}/Listings`,{params});
  }


  getListingsSuggestions(query:string):Observable<string[]>{
    console.log('Calling API with query:', query);
    return  this.http.get<SuggestionsDTO[]>(`${this.apiUrl}/Listings/suggestions`,{params:{query}})
    .pipe(
      map(suggestions => suggestions.map(s => s.value))
    );
  }


  getPropertyTypes() {
    return this.http.get<PropertyType[]>(`${this.apiUrl}/PropertyTypes`);
  }

  getAmenities() {
    return this.http.get<Amenity[]>(`${this.apiUrl}/amenities`);
  }

  getRoomTypes() {
    return this.http.get<RoomType[]>(`${this.apiUrl}/RoomTypes`);
  }

  getListingById(id: string) {
    return this.http.get<Listing>(`${this.apiUrl}/Listings/${id}`);
}

  deleteListing(id: string) {
    return this.http.delete<Listing>(`${this.apiUrl}/Listings/${id}`);
  }

  getListingsByHostId(hostId: string) {
    return this.http.get<Listing[]>(`${this.apiUrl}/Listings/host/${hostId}`).pipe(
      tap(listings => {
        this.hostListingsSignal.set(listings);
      }),
      catchError(error => {
        return of([]);
      })
    )
  }

  getEmptyListingsByHostId(hostId: string) {
    return this.http.get<Listing[]>(`${this.apiUrl}/Listings/host/${hostId}`).pipe(
      map(listings => {
        const drafts = listings.filter(listing => listing.verificationStatusId === 1);
        this.hostDraftsSignal.set(drafts);
        return drafts;
      }),
      catchError(error => {
        this.hostDraftsSignal.set([]);
        return of([]);
      })
    )
  }

  createEmptyListing() {
    return this.http.post<Listing>(`${this.apiUrl}/listings/empty`, {}).pipe(
      tap(listing => {
        this.hostDraftsSignal.update(drafts => [...drafts, listing]);
      }),
      catchError(error => {
        return of(null);
      })
    )
  }

  updateListingStatus(id: string, verificationStatusId: {verificationStatusId: number}) {
    return this.http.put(`${this.apiUrl}/listings/${id}/update-verification`, verificationStatusId, { responseType: 'text' });
  }

  updateListing(id: string, listing: NewListing) {
    return this.http.put<NewListing>(`${this.apiUrl}/listings/${id}`, listing);
  }

  updateListingPhotos(id: string, photos: { file: File, caption: string }[]) {
    const formData = new FormData();
    photos.forEach((photo, index) => {
      formData.append(`photos[${index}].file`, photo.file);
      formData.append(`photos[${index}].caption`, photo.caption);
    });

    return this.http.put(`${this.apiUrl}/listings/${id}/photos/replace`, formData);
  }

  uploadListingPhoto(listingId: string, file: File, caption: string) {
    const formData = new FormData();
    formData.append('photos[0].file', file);
    formData.append('photos[0].caption', caption);

    return this.http.post(`${this.apiUrl}/listings/${listingId}/photos`, formData);
  }

  uploadListingPhotos(listingId: string, photos: { file: File, caption: string }[]): Observable<any> {
    const formData = new FormData();
    photos.forEach((photo, index) => {
      formData.append(`photos[${index}].file`, photo.file);
      formData.append(`photos[${index}].caption`, photo.caption);
    });

    return this.http.post(`${this.apiUrl}/listings/${listingId}/photos`, formData);
  }

}
