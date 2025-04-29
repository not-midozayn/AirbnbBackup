// import { Component } from '@angular/core';

// @Component({
//   selector: 'app-property-type',
//   imports: [],
//   templateUrl: './property-type.component.html',
//   styleUrl: './property-type.component.css'
// })
// export class PropertyTypeComponent {

// }






import { Component, EventEmitter, Input, NgModule, OnInit, Output } from '@angular/core';


import { CarouselModule } from 'primeng/carousel';
import { ButtonModule } from 'primeng/button';
import { TagModule } from 'primeng/tag';
import { PropertyTypeService } from '../../core/services/property-type.service';
import { PropertyType } from '../../core/models/Iproperty-type';
import { CommonModule } from '@angular/common';

@Component({
    selector: 'carousel-basic-demo',
    templateUrl: './property-type.component.html',
    standalone: true,
    imports: [CarouselModule, ButtonModule, TagModule , CommonModule],
    
})
export class CarouselBasicDemo implements OnInit {
    // propertytypes:PropertyType[] = [];
    @Output() propertyTypeSelected= new EventEmitter<string>();
    responsiveOptions: any[] | undefined;

    constructor(private _propertyTypeService: PropertyTypeService) {}

          propertytypes: PropertyType[] = [
          {
            propertyTypeId: '1',
            PropertyTypeName: 'Apartment',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/4041/4041940.png'
          },
          {
            propertyTypeId: '2',
            PropertyTypeName: 'Villa',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/3123/3123490.png'
          },
          {
            propertyTypeId: '3',
            PropertyTypeName: 'Townhouse',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/3944/3944424.png'
          },
          {
            propertyTypeId: '4',
            PropertyTypeName: 'Studio',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/6385/6385979.png'
          },
          {
            propertyTypeId: '5',
            PropertyTypeName: 'Penthouse',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/3624/3624080.png'
          },
          {
            propertyTypeId: '6',
            PropertyTypeName: 'Cabin',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/5872/5872695.png'
          },
          {
            propertyTypeId: '7',
            PropertyTypeName: 'Farmhouse',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/6998/6998725.png'
          },
          {
            propertyTypeId: '8',
            PropertyTypeName: 'Loft',
            PropertyTypeImage: 'https://cdn-icons-png.flaticon.com/512/3176/3176292.png'
          }
        ];
    ngOnInit() {
        this._propertyTypeService.getAllPropertyTypes().subscribe({
          next: (data)=>{
            this.propertytypes = data;
            console.log(this.propertytypes)
          },
          error: (err)=>{
            console.error(err);
          }
        });


       this.responsiveOptions = [
            {
                breakpoint: '1400px',
                numVisible: 2,
                numScroll: 1
            },
            {
                breakpoint: '1199px',
                numVisible: 3,
                numScroll: 1
            },
            {
                breakpoint: '767px',
                numVisible: 2,
                numScroll: 1
            },
            {
                breakpoint: '575px',
                numVisible: 1,
                numScroll: 1
            }
        ]
    }

    OnSelectedPropertyType(id:any){
      console.log("hello")
      this.propertyTypeSelected.emit(id);
      console.log(id);
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