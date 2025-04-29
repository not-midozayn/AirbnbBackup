import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ImagesService {
  private baseUrl = 'https://localhost:7200';

  constructor(private http: HttpClient) { }

  getImageUrl(relativePath: string): string {
    if (!relativePath) {
      return 'default-img.png';
    }

    // If the path is already a full URL, return it as is
    if (relativePath.startsWith('http')) {
      return relativePath;
    }

    // Remove any leading slash to avoid double slashes
    const cleanPath = relativePath.startsWith('/') ? relativePath.slice(1) : relativePath;
    return `${this.baseUrl}/${cleanPath}`;
  }

  DeleteImage(listingId: string, photoId: string){
    return this.http.delete(`${this.baseUrl}/api/Listings/${listingId}/Photos/${photoId}`);
  }
}
