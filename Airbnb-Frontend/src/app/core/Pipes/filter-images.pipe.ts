import { Pipe, PipeTransform } from '@angular/core';
import { UploadedImage } from '../../features/AirbnbYourHome/add-listing/add-listing.component';

@Pipe({
  name: 'filterImages',
  standalone: true
})
export class FilterImagesPipe implements PipeTransform {
  transform(images: UploadedImage[], isPreview: boolean): UploadedImage[] {
    if (!images) return [];

    // Preview section: only show newly uploaded images (with file)
    // Existing section: only show saved images (without file)
    return isPreview ?
      images.filter(image => image.file !== null) :
      images.filter(image => image.file === null);
  }
}
