import { Component, EventEmitter, HostListener, Input, OnChanges, OnInit, Output, SimpleChanges, ViewChild } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { debounceTime, of, Subject, switchMap } from 'rxjs';
import { ListingsService } from '../../core/services/listings.service';
import { CommonModule } from '@angular/common';
import { ScrollService } from '../../core/services/scroll-service.service';
import { ToastrService } from 'ngx-toastr';
import { DateRangePickerComponent } from '../date-range-picker/date-range-picker.component';


interface GuestCount {
  adults: number;
  children: number;
  infants: number;
  pets: number;
  [key: string]: number;
}

interface GuestType {
  key: keyof GuestCount;
  label: string;
  description: string;
  minValue: number;
  maxValue: number;
}

interface SearchParams {
  guests: string;
}


@Component({
  selector: 'app-search',
  standalone: true,
  imports: [CommonModule,FormsModule , DateRangePickerComponent],
  templateUrl: './search.component.html',
  styleUrl: './search.component.css'
})

export class SearchComponent implements OnInit , OnChanges {
  @ViewChild(DateRangePickerComponent) public dateRangePicker!: DateRangePickerComponent;
  highlightedIndex: number = -1;
 @Input() Location ='';
//  @Input()startDate = '';
//  @Input()endDate = '';
 @Input() Capacity=0;

 @Input() startDate: any = null;
@Input() endDate: any = null;

onDateRangeSelected(range: { startDate: Date, endDate: Date }) {
  this.startDate = range.startDate;
  this.endDate = range.endDate;
}

  suggestions: string[] = [];
  showSuggestions: boolean = false;
  selectedFromSuggestions: boolean = false;

  @Output() searchChanged = new EventEmitter<{[key:string]:any}>();

  private LocationInputs$ = new Subject<string>();

  constructor(private _ListingsService:ListingsService , private _ScrollService:ScrollService , private _ToastrService: ToastrService){}

  ngOnInit(): void {
    this.LocationInputs$.pipe(
      // debounceTime(300),
      switchMap(value => value ? this._ListingsService.getListingsSuggestions(value) : of([]))
    ).subscribe({
      next: suggestions =>{ this.suggestions = suggestions;
      console.log('suggestions:',suggestions);
      this.showSuggestions=true;
      }
    });
  }

  ngOnChanges(changes: SimpleChanges) {
    if (changes['Location']) {
      this.Location = changes['Location'].currentValue;
    }
    if (changes['startDate']) {
      this.startDate = changes['startDate'].currentValue;
    }
  }
  onCityInputChange(value: string) {
    this.highlightedIndex = -1;
    this.selectedFromSuggestions = false;
    if (!value.trim()) {

      this._ListingsService.getListingsSuggestions('s').subscribe((res) => {
        this.suggestions = res.slice(0, 5); 
        this.showSuggestions = true;
      });
      return;
    }
    this.LocationInputs$.next(value);
  }

  selectSuggestion(suggestion: string) {
    this.Location = suggestion;
    this.suggestions = [];
    this.highlightedIndex = -1;
    this.showSuggestions = false;
    this.selectedFromSuggestions = true;
  }
  


  private formatDate(date: Date): string {
    const year = date.getFullYear();
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    return `${year}-${month}-${day}`;
  }
  
  onSearch() {
    this._ScrollService.stopScroll();
  
    const formattedStartDate = this.startDate ? this.formatDate(this.startDate) : '';
    const formattedEndDate = this.endDate ? this.formatDate(this.endDate) : '';
  
    this.searchChanged.emit({
      Location: this.Location,
      startDate: formattedStartDate,
      endDate: formattedEndDate,
      Capacity: this.getTotalPeople()
    });
  }
  

  clearInputs() {
    this.Location = '';
    this.startDate = '';
    this.endDate = '';
    this.guests={
      adults: 0,
      children: 0,
      infants: 0,
      pets: 0
    };
  }


  onKeyDown(event: KeyboardEvent) {
    if (!this.suggestions.length) return;
  
    switch (event.key) {
      case 'ArrowDown':
        this.highlightedIndex = (this.highlightedIndex + 1) % this.suggestions.length;
        event.preventDefault();
        break;
      case 'ArrowUp':
        this.highlightedIndex = (this.highlightedIndex - 1 + this.suggestions.length) % this.suggestions.length;
        event.preventDefault();
        break;
      case 'Enter':
        if (this.highlightedIndex >= 0) {
          this.selectSuggestion(this.suggestions[this.highlightedIndex]);
          event.preventDefault();
        }
        break;
      case 'Escape':
        this.suggestions = [];
        this.highlightedIndex = -1;
        this.showSuggestions = false;
        break;
    }
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    const inputElement = document.getElementById('location');
    const suggestionsList = document.querySelector('ul');
    const guestMenu = document.querySelector('.absolute.right-0.mt-2');

    if (inputElement && !inputElement.contains(event.target as Node) && suggestionsList && !suggestionsList.contains(event.target as Node)) {
      this.showSuggestions = false;
    }

    if (guestMenu && !guestMenu.contains(event.target as Node)) {
      this.isGuestMenuOpen = false;
    }
  }


  showInitialSuggestions(){

      this._ListingsService.getListingsSuggestions('s').subscribe((res)=>{
        this.suggestions=res
      })
  }







  //--------------------------------------




  
  isUserMenuOpen = false;
  isGuestMenuOpen = false;
  isMobileSearchOpen = false;
  showMobileGuestMenu = false;
  guestText = 'Add guests';
  guests: GuestCount = {
    adults: 0,
    children: 0,
    infants: 0,
    pets: 0
  };
  guestTypes: GuestType[] = [
    { key: 'adults', label: 'Adults', description: 'Ages 13 or above', minValue: 1, maxValue: 16 },
    { key: 'children', label: 'Children', description: 'Ages 2–12', minValue: 0, maxValue: 16 },
    { key: 'infants', label: 'Infants', description: 'Under 2', minValue: 0, maxValue: 5 },
    { key: 'pets', label: 'Pets', description: 'Bringing an assistance animal?', minValue: 0, maxValue: 5 }
  ];
  searchParams: SearchParams = {
    guests: 'Add guests'
  };

  
  showGuestMenuInMobile(): void {
    this.showMobileGuestMenu = true;
    this.isGuestMenuOpen = true; // This is for the desktop version
    console.log('Opened Guest Menu', this.isGuestMenuOpen);
  }

  hideGuestMenuInMobile(): void {
    this.showMobileGuestMenu = false;
    this.isGuestMenuOpen = false;
    console.log('Closed Guest Menu', this.isGuestMenuOpen);
  }

  toggleGuestMenu(event:Event):void{
      event.stopPropagation();
      this.isGuestMenuOpen = !this.isGuestMenuOpen;
  }

  // hideGuestMenu():void{
  //   this.isGuestMenuOpen=false;
  // }

  // @HostListener('document:click', ['$event'])
  // onDocumentClick(event: MouseEvent): void {
  //   const target = event.target as HTMLElement;
  //   if (!target.closest('.guest-menu-container') && this.isGuestMenuOpen) {
  //     this.hideGuestMenu();
  //   }
  // }

//   @HostListener('document:keydown.escape', ['$event'])
// onEscapePress(event: KeyboardEvent): void {
//   if (this.isGuestMenuOpen) {
//     this.hideGuestMenu();
//   }
// }

  // @HostListener('document:click')
  // closeMenus(): void {
  //   if (!this.isMobileSearchOpen || !this.isGuestMenuOpen) {
  //     this.isUserMenuOpen = false;
  //     this.isGuestMenuOpen = false;
  //   }
  // }

  
  // @HostListener('click', ['$event'])
  // onClick(event: Event): void {
  //   const target = event.target as HTMLElement;
  //   if (!target.closest('.mobile-search-content') && this.isMobileSearchOpen && !this.isGuestMenuOpen) {
  //     // this.closeMobileSearch();
  //   }
  //   event.stopPropagation();
  // }


  updateGuestText(): void {
    const parts = [];
    const totalPeople = this.getTotalPeople();

    if (totalPeople > 0) {
      parts.push(`${totalPeople} ${totalPeople === 1 ? 'guest' : 'guests'}`);
    } else {
      parts.push('Add guests');
    }

    if (this.guests.infants > 0) {
      parts.push(`${this.guests.infants} ${this.guests.infants === 1 ? 'infant' : 'infants'}`);
    }

    if (this.guests.pets > 0) {
      parts.push(`${this.guests.pets} ${this.guests.pets === 1 ? 'pet' : 'pets'}`);
    }

    this.guestText = parts.join(' · ');
    this.searchParams.guests = this.guestText;
  }

  isDecrementDisabled(type: keyof GuestCount): boolean {
    const guestType = this.guestTypes.find(t => t.key === type);
    return guestType ? this.guests[type] <= guestType.minValue : true;
  }

  isIncrementDisabled(type: keyof GuestCount): boolean {
    if (type === 'adults' || type === 'children') {
      return this.getTotalPeople() >= 16;
    }
    const guestType = this.guestTypes.find(t => t.key === type);
    return guestType ? this.guests[type] >= guestType.maxValue : true;
  }

  updateGuests(type: keyof GuestCount, change: number): void {
    const guestType = this.guestTypes.find(t => t.key === type);
    if (!guestType) return;

    const newValue = this.guests[type] + change;

    if (type === 'adults' || type === 'children') {
      const wouldExceedLimit =
        (type === 'adults' ? newValue : this.guests.adults) +
        (type === 'children' ? newValue : this.guests.children) > 16;

      if (!wouldExceedLimit && newValue >= guestType.minValue) {
        this.guests[type] = newValue;
      }
    } else {
      this.guests[type] = Math.min(
        Math.max(guestType.minValue, newValue),
        guestType.maxValue
      );
    }

    this.updateGuestText();
  }



  resetGuests(): void {
    this.guests = {
      adults: 0,
      children: 0,
      infants: 0,
      pets: 0
    };
    this.guestText = 'Add guests';
    this.searchParams.guests = this.guestText;
  }

  getTotalPeople(): number {
    return this.guests.adults + this.guests.children;
  }





}
