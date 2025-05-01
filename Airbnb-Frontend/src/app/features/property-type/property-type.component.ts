import {
  Component,
  EventEmitter,
  Input,
  NgModule,
  OnInit,
  Output,
} from '@angular/core';
import { CarouselModule } from 'primeng/carousel';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { PropertyTypeService } from '../../core/services/property-type.service';
import { PropertyType } from '../../core/models/Iproperty-type';
import { CommonModule } from '@angular/common';
import { ImagesService } from '../../core/services/images.service';

@Component({
  selector: 'carousel-basic-demo',
  templateUrl: './property-type.component.html',
  standalone: true,
  imports: [CarouselModule, ButtonModule, TagModule, CommonModule],
})
export class CarouselBasicDemo implements OnInit {
  @Input() value: any[] = [];
  @Output() propertyTypeSelected = new EventEmitter<string>();
  responsiveOptions: any[] | undefined;
  propertytypes: PropertyType[] = [];

  constructor(private _propertyTypeService: PropertyTypeService, public imageService: ImagesService) {}

  ngOnInit() {
    this._propertyTypeService.getAllPropertyTypes().subscribe({
      next: (data) => {
        this.propertytypes = data;
      },
      error: (err) => {
        console.error(err);
      },
    });

    this.responsiveOptions = [
      {
        breakpoint: '1400px',
        numVisible: 2,
        numScroll: 1,
      },
      {
        breakpoint: '1199px',
        numVisible: 3,
        numScroll: 1,
      },
      {
        breakpoint: '767px',
        numVisible: 2,
        numScroll: 1,
      },
      {
        breakpoint: '575px',
        numVisible: 1,
        numScroll: 1,
      },
    ];
  }

  OnSelectedPropertyType(id: any) {
    this.propertyTypeSelected.emit(id);
  }

  getSeverity(status: string) {
    switch (status) {
      case 'INSTOCK':
        return 'success';
      case 'LOWSTOCK':
        return 'warn';
      case 'OUTOFSTOCK':
        return 'danger';
      default:
        return 'success';
    }
  }
}
