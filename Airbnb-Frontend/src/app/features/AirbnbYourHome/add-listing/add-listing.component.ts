import { CommonModule, Location } from '@angular/common';
import { Component, OnDestroy, OnInit, ChangeDetectorRef } from '@angular/core';
import { FormArray, FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators, ValidationErrors } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ListingsService } from '../../../core/services/listings.service';
import { Observable, Subscription, forkJoin } from 'rxjs';
import { switchMap, take, map } from 'rxjs/operators';
import { PropertyType } from '../../../core/models/PropertyType';
import { RoomType } from '../../../core/models/RoomType';
import { Amenity } from '../../../core/models/Amenity';
import { DragDropModule, CdkDragDrop, moveItemInArray } from '@angular/cdk/drag-drop';
import { ImagesService } from '../../../core/services/images.service';
import { FilterImagesPipe } from '../../../core/Pipes/filter-images.pipe';
import { AvailabilityCalendarService } from '../../../core/services/availability-calendar.service';
import { NewListing } from '../../../core/models/NewListing';
import { DateRangePickerComponent } from '../../date-range-picker/date-range-picker.component';

export interface UploadedImage {
  file: File | null;
  preview: string;
  caption: string;
}

interface FormStep {
  controlName: string;
  isValid: () => boolean;
}

interface LoadingResult {
  listingData: any;
  availability: Array<{
    date: Date;
    isAvailable: boolean | null;
    specialPrice?: number;
  }>;
}

@Component({
  selector: 'app-add-listing',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, DragDropModule, FormsModule, FilterImagesPipe, DateRangePickerComponent],
  templateUrl: './add-listing.component.html',
  styleUrls: ['./add-listing.component.css'],
  providers: [ImagesService]
})
export class AddListingComponent implements OnInit, OnDestroy {
  private subscriptions = new Subscription();
  currentStep = 1;
  totalSteps = 10;
  isLoading = false;
  attemptedToContinue = false;
  listingForm!: FormGroup;
  uploadedImages: UploadedImage[] = [];
  fileErrors: string[] = [];
  formErrors: any = {};

  PropertyTypes: PropertyType[] = [];
  RoomTypes: RoomType[] = [];
  Amenities: Amenity[] = [];
  CancellationPolicies = [
    { id: 1, name: 'Flexible' },
    { id: 2, name: 'Moderate' },
    { id: 3, name: 'Strict' },
    { id: 4, name: 'Super Strict 30 Days' },
    { id: 5, name: 'Super Strict 60 Days' }
  ];

  selectedDateRange: { startDate: Date | null, endDate: Date | null } = {
    startDate: null,
    endDate: null
  };

  selectedAvailability: boolean = true;

  private formSteps: FormStep[] = [
    { controlName: 'propertyType', isValid: () => this.listingForm?.get('propertyType')?.valid ?? false },
    { controlName: 'roomType', isValid: () => this.listingForm?.get('roomType')?.valid ?? false },
    { controlName: 'amenityType', isValid: () => this.listingForm?.get('amenityType')?.valid ?? false },
    {
      controlName: 'address',
      isValid: () => ['country', 'streetAddress', 'city', 'state', 'postalCode']
        .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false)
    },
    {
      controlName: 'titleDesc',
      isValid: () => ['title', 'description']
        .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false)
    },
    {
      controlName: 'pricing',
      isValid: () => ['pricePerNight', 'serviceFee', 'securityDeposit']
        .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false)
    },
    {
      controlName: 'duration',
      isValid: () => {
        const durationValid = ['minNights', 'maxNights']
          .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false);

        // Check if date range is selected and valid
        const dateRangeValid = Boolean(
          this.selectedDateRange?.startDate &&
          this.selectedDateRange?.endDate &&
          this.selectedDateRange.endDate >= this.selectedDateRange.startDate
        );

        if (this.attemptedToContinue) {
          if (!this.selectedDateRange?.startDate || !this.selectedDateRange?.endDate) {
            this.formErrors['submit'] = 'Please select both start and end dates for availability';
          } else if (this.selectedDateRange.endDate < this.selectedDateRange.startDate) {
            this.formErrors['submit'] = 'End date cannot be earlier than start date';
          } else if (!durationValid) {
            this.formErrors['submit'] = 'Please set valid minimum and maximum nights';
          } else {
            delete this.formErrors['submit'];
          }
        }

        return durationValid && dateRangeValid;
      }
    },
    { controlName: 'cancellationPolicyId', isValid: () => this.listingForm?.get('cancellationPolicyId')?.valid ?? false },
    {
      controlName: 'capacity',
      isValid: () => ['guests', 'bedrooms', 'bathrooms']
        .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false)
    },
    {
      controlName: 'images', isValid: () => {
        const newPhotos = this.uploadedImages.filter(img => img.file !== null);
        return newPhotos.length >= 4;
      }
    }
  ];

  constructor(
    private fb: FormBuilder,
    private route: ActivatedRoute,
    private router: Router,
    private location: Location,
    private listingsService: ListingsService,
    private imagesService: ImagesService,
    private availabilityCalendarService: AvailabilityCalendarService,
    private cdr: ChangeDetectorRef
  ) { }

  listingId!: string;

  ngOnInit(): void {
    this.subscriptions.add(
      this.route.params.subscribe(params => {
        this.listingId = params['id'];
        if (this.listingId) {
          console.log('Listing ID:', this.listingId);
          this.loadListingData(this.listingId);
          this.loadAvailabilityData(this.listingId);
        }
        this.loadAllPropertyTypes();
        this.loadAllRoomTypes();
        this.loadAllAmenities();
      })
    );

    this.initializeForm();
  }

  private initializeForm(): void {
    this.listingForm = this.fb.group({
      propertyType: ['', Validators.required],
      roomType: ['', Validators.required],
      amenityType: this.fb.array([], [Validators.required, Validators.minLength(1)]),
      country: ['', [Validators.required, Validators.minLength(2)]],
      streetAddress: ['', [Validators.required, Validators.minLength(5)]],
      city: ['', [Validators.required, Validators.minLength(2)]],
      state: ['', [Validators.required, Validators.minLength(2)]],
      postalCode: ['', [Validators.required, Validators.minLength(4)]],
      title: ['', [Validators.required, Validators.minLength(10), Validators.maxLength(32)]],
      description: ['', [Validators.required, Validators.minLength(50), Validators.maxLength(500)]],
      guests: [0, [Validators.required, Validators.min(1), Validators.max(50)]],
      bedrooms: [0, [Validators.required, Validators.min(1), Validators.max(20)]],
      bathrooms: [0, [Validators.required, Validators.min(1), Validators.max(20)]],
      cancellationPolicyId: ['', Validators.required],
      pricePerNight: [50, [Validators.required, Validators.min(1), Validators.max(10000)]],
      serviceFee: [0, [Validators.required, Validators.min(0), Validators.max(1000)]],
      securityDeposit: [0, [Validators.required, Validators.min(0), Validators.max(5000)]],
      minNights: [1, [Validators.required, Validators.min(1), Validators.max(365)]],
      maxNights: [30, [Validators.required, Validators.min(1), Validators.max(365)]],
      images: [[], [Validators.required, Validators.minLength(4)]]
    });
  }

  loadListingData(listingId: string): void {
    this.isLoading = true;
    console.log('Loading listing data for ID:', listingId);

    this.subscriptions.add(
      this.listingsService.getListingById(listingId).pipe(
        switchMap(data => {
          const listingData = data;
          return this.availabilityCalendarService.checkAvailabilityOfListingEmpty(listingId).pipe(
            switchMap((response: { hasAvailability: boolean }) => {
              if (response.hasAvailability) {
                return this.availabilityCalendarService.getAvailabilityCalendarOfListing(listingId).pipe(
                  map(availability => ({ listingData, availability }))
                );
              }
              return new Observable<LoadingResult>(subscriber => subscriber.next({ listingData, availability: [] }));
            })
          );
        })
      ).subscribe({
        next: (result: LoadingResult) => {
          const { listingData: data, availability } = result;
          if (data) {
            // Clear existing amenities array
            while (this.amenityTypeArray.length) {
              this.amenityTypeArray.removeAt(0);
            }

            // Add each amenity ID to the FormArray
            if (data.amenities && data.amenities.length > 0) {
              data.amenities.forEach((amenity: { id: string }) => {
                this.amenityTypeArray.push(this.fb.control(amenity.id));
              });
            }

            // Handle existing images with proper URL formatting
            if (data.imageUrls && data.imageUrls.length > 0) {
              this.uploadedImages = data.imageUrls.map((url: string) => ({
                file: null,
                preview: this.imagesService.getImageUrl(url),
                caption: ''
              }));
              this.listingForm.patchValue({
                images: this.uploadedImages
              });
            }

            // Set form values
            this.listingForm.patchValue({
              propertyType: data.propertyTypeId,
              roomType: data.roomTypeId,
              country: data.country,
              streetAddress: data.addressLine1,
              city: data.city,
              state: data.state,
              postalCode: data.postalCode,
              title: data.title,
              description: data.description,
              guests: data.capacity,
              bedrooms: data.bedrooms,
              bathrooms: data.bathrooms,
              pricePerNight: data.pricePerNight,
              serviceFee: data.serviceFee,
              minNights: data.minNights,
              maxNights: data.maxNights,
              cancellationPolicyId: data.cancellationPolicy?.id
            });

            // Set the date range if availability data exists
            if (availability && availability.length > 0) {
              // Find the first available date range
              const availableDates = availability
                .filter(a => a.isAvailable)
                .map(a => new Date(a.date))
                .sort((a, b) => a.getTime() - b.getTime());

              if (availableDates.length > 0) {
                this.selectedDateRange = {
                  startDate: availableDates[0],
                  endDate: availableDates[availableDates.length - 1]
                };
              }
            }

            this.isLoading = false;
          }
        },
        error: (error) => {
          console.error('Error loading listing data', error);
          this.formErrors['general'] = 'Failed to load listing data';
          this.isLoading = false;
        }
      })
    );
  }

  loadAvailabilityData(listingId: string): void {
    this.subscriptions.add(
      this.availabilityCalendarService.getListingDateRange(listingId).subscribe({
        next: (dateRange) => {
          if (dateRange) {
            this.selectedDateRange = {
              startDate: dateRange.startDate,
              endDate: dateRange.endDate
            };
            this.cdr.detectChanges();
          }
        },
        error: (error) => {
          console.error('Error loading availability data', error);
          this.formErrors['availability'] = 'Failed to load availability dates';
        }
      })
    );
  }

  loadAllPropertyTypes(): void {
    this.isLoading = true;
    this.subscriptions.add(
      this.listingsService.getPropertyTypes().subscribe({
        next: (data) => {
          this.PropertyTypes = data;
        },
        error: (error) => {
          console.log('Error loading property types', error.error.message);
          this.formErrors['general'] = 'Failed to load property types';
          this.isLoading = false;
        }
      })
    )
  }

  loadAllRoomTypes(): void {
    this.isLoading = true;
    this.subscriptions.add(
      this.listingsService.getRoomTypes().subscribe({
        next: (data) => {
          this.RoomTypes = data;
        },
        error: (error) => {
          console.log('Error loading rooms', error.error.message);
          this.formErrors['general'] = 'Failed to load rooms';
          this.isLoading = false;
        }
      })
    )
  }

  loadAllAmenities(): void {
    this.isLoading = true;
    this.subscriptions.add(
      this.listingsService.getAmenities().subscribe({
        next: (data) => {
          this.Amenities = data;
        },
        error: (error) => {
          console.log('Error loading amenities', error.error.message);
          this.formErrors['general'] = 'Failed to load amenities';
          this.isLoading = false;
        }
      })
    )
  }

  get amenityTypeArray() {
    return this.listingForm.get('amenityType') as FormArray;
  }

  toggleAmenity(amenityId: string): void {
    const index = this.amenityTypeArray.value.indexOf(amenityId);
    if (index === -1) {
      this.amenityTypeArray.push(this.fb.control(amenityId));
    } else {
      this.amenityTypeArray.removeAt(index);
    }
  }

  isAmenitySelected(amenityId: string): boolean {
    return this.amenityTypeArray.value.includes(amenityId);
  }

  incrementGuests(): void {
    const currentValue = this.listingForm.get('guests')?.value || 1;
    this.listingForm.patchValue({ guests: currentValue + 1 });
  }

  decrementGuests(): void {
    const currentValue = this.listingForm.get('guests')?.value || 0;
    if (currentValue > 0) {
      this.listingForm.patchValue({ guests: currentValue - 1 });
    }
  }

  incrementBedrooms(): void {
    const currentValue = this.listingForm.get('bedrooms')?.value || 0;
    this.listingForm.patchValue({ bedrooms: currentValue + 1 });
  }

  decrementBedrooms(): void {
    const currentValue = this.listingForm.get('bedrooms')?.value || 0;
    if (currentValue > 0) {
      this.listingForm.patchValue({ bedrooms: currentValue - 1 });
    }
  }

  incrementBathrooms(): void {
    const currentValue = this.listingForm.get('bathrooms')?.value || 0;
    this.listingForm.patchValue({ bathrooms: currentValue + 1 });
  }

  decrementBathrooms(): void {
    const currentValue = this.listingForm.get('bathrooms')?.value || 0;
    if (currentValue > 0) {
      this.listingForm.patchValue({ bathrooms: currentValue - 1 });
    }
  }

  onDragOver(event: DragEvent): void {
    event.preventDefault();
    event.stopPropagation();
  }

  onDragLeave(event: DragEvent): void {
    event.preventDefault();
    event.stopPropagation();
  }

  onDrop(event: DragEvent): void {
    event.preventDefault();
    event.stopPropagation();
    const files = event.dataTransfer?.files;
    if (files) {
      this.handleFiles(Array.from(files));
    }
  }

  onFileSelected(event: Event): void {
    const element = event.target as HTMLInputElement;
    const files = element.files;
    if (files) {
      this.handleFiles(Array.from(files));
    }
  }

  private handleFiles(files: File[]): void {
    this.fileErrors = []; // Clear previous errors
    const allowedTypes = ['.jpg', '.jpeg', '.png', '.gif'];
    const validFiles = files.filter(file => {
      const extension = '.' + file.name.split('.').pop()?.toLowerCase();
      const isValidType = allowedTypes.includes(extension);
      const isValidSize = file.size <= 10 * 1024 * 1024; // 10MB limit

      if (!isValidType) {
        this.fileErrors.push(`${file.name}: Invalid file type. Allowed types are: ${allowedTypes.join(', ')}`);
      }
      if (!isValidSize) {
        this.fileErrors.push(`${file.name}: File too large. Maximum size is 10MB`);
      }

      return isValidType && isValidSize;
    });

    const readerPromises = validFiles.map(file => {
      return new Promise<UploadedImage>((resolve) => {
        const reader = new FileReader();
        reader.onload = (e: ProgressEvent<FileReader>) => {
          const preview = e.target?.result as string;
          resolve({ file, preview, caption: '' });
        };
        reader.readAsDataURL(file);
      });
    });

    Promise.all(readerPromises).then(newImages => {
      this.uploadedImages = [...this.uploadedImages, ...newImages];
      this.listingForm.patchValue({
        images: this.uploadedImages
      });
      // Force change detection
      this.listingForm.get('images')?.updateValueAndValidity();
    });
  }

  removeImage(index: number): void {
    this.uploadedImages.splice(index, 1);
    this.listingForm.patchValue({
      images: this.uploadedImages
    });
  }

  drop(event: CdkDragDrop<string[]>): void {
    moveItemInArray(this.uploadedImages, event.previousIndex, event.currentIndex);
    this.listingForm.patchValue({
      images: this.uploadedImages
    });
  }

  onStepChange(direction: 'next' | 'prev'): void {
    if (direction === 'next') {
      this.attemptedToContinue = true;
      if (this.isCurrentStepValid()) {
        this.currentStep++;
        this.formErrors = {};
        this.attemptedToContinue = false;
      }
    } else {
      this.currentStep--;
      this.formErrors = {};
      this.attemptedToContinue = false;
    }
  }

  nextStep(): void {
    this.onStepChange('next');
  }

  previousStep(): void {
    this.onStepChange('prev');
  }

  private getControlsForStep(step: number): string[] {
    switch (step) {
      case 1:
        return ['propertyType'];
      case 2:
        return ['roomType'];
      case 3:
        return ['amenityType'];
      case 4:
        return ['country', 'streetAddress', 'city', 'state', 'postalCode'];
      case 5:
        return ['title', 'description'];
      case 6:
        return ['pricePerNight', 'serviceFee', 'securityDeposit'];
      case 7:
        return ['minNights', 'maxNights'];
      case 8:
        return ['cancellationPolicyId'];
      case 9:
        return ['guests', 'bedrooms', 'bathrooms'];
      case 10:
        return ['images'];
      default:
        return [];
    }
  }

  isCurrentStepValid(): boolean {
    const step = this.formSteps[this.currentStep - 1];
    if (!step) return false;

    // Special validation for duration step (Step 7)
    if (step.controlName === 'duration') {
      const durationValid = ['minNights', 'maxNights']
        .every(ctrl => this.listingForm?.get(ctrl)?.valid ?? false);

      // Check if date range is selected
      const dateRangeValid = Boolean(
        this.selectedDateRange?.startDate &&
        this.selectedDateRange?.endDate
      );

      if (this.attemptedToContinue) {
        if (!dateRangeValid) {
          this.formErrors['submit'] = 'Please select both start and end dates for availability';
        } else if (!durationValid) {
          this.formErrors['submit'] = 'Please set valid minimum and maximum nights';
        } else {
          delete this.formErrors['submit'];
        }
      }

      return durationValid && dateRangeValid;
    }

    return step.isValid();
  }

  saveDraft(): void {
    if (this.listingForm.dirty) {
      const formData = this.listingForm.value;
      const listing = this.prepareListing(formData);

      this.subscriptions.add(
        this.listingsService.updateListing(this.listingId, listing).subscribe({
          next: () => {
            this.router.navigate(['/hosting/become-a-host']);
          },
          error: (error) => {
            console.error('Error saving draft', error);
            this.formErrors['submit'] = 'Failed to save draft';
          }
        })
      );
    }
  }

  private prepareListing(formData: any): NewListing {
    return {
      minNights: formData.minNights,
      maxNights: formData.maxNights,
      cancellationPolicyId: formData.cancellationPolicyId,
      title: formData.title,
      description: formData.description,
      propertyTypeId: formData.propertyType,
      roomTypeId: formData.roomType,
      capacity: formData.guests,
      bedrooms: formData.bedrooms,
      bathrooms: formData.bathrooms,
      pricePerNight: formData.pricePerNight,
      securityDeposit: formData.securityDeposit,
      serviceFee: formData.serviceFee,
      addressLine1: formData.streetAddress,
      addressLine2: '',
      city: formData.city,
      state: formData.state,
      country: formData.country,
      postalCode: formData.postalCode,
      instantBooking: true,
      latitude: 0,
      longitude: 0,
      currencyId: 1,
      amenityIds: formData.amenityType || []
    };
  }

  onRangeSelected(event: { startDate: Date, endDate: Date }): void {
    Promise.resolve().then(() => {
      this.selectedDateRange = {
        startDate: event.startDate,
        endDate: event.endDate
      };
      // Clear submit error when dates are selected
      delete this.formErrors['submit'];
      delete this.formErrors['dateRange'];
      this.cdr.detectChanges(); // Force change detection
    });
  }

  onAvailabilitySet(event: { range: { startDate: Date, endDate: Date }, isAvailable: boolean }): void {
    Promise.resolve().then(() => {
      this.selectedDateRange = {
        startDate: event.range.startDate,
        endDate: event.range.endDate
      };
      this.selectedAvailability = event.isAvailable; // Store the isAvailable value
      // Clear submit error when availability is set
      delete this.formErrors['submit'];
      delete this.formErrors['dateRange'];
      this.cdr.detectChanges(); // Force change detection
    });
  }

  onSubmit(): void {
    if (!this.listingForm.valid) {
      this.markFormGroupTouched(this.listingForm);
      this.formErrors['submit'] = 'Please fill in all required fields correctly.';
      return;
    }

    if (!this.selectedDateRange?.startDate || !this.selectedDateRange?.endDate) {
      this.formErrors['dateRange'] = 'Please select availability dates.';
      return;
    }

    const formData = this.listingForm.value;
    this.isLoading = true;
    const listing = this.prepareListing(formData);

    // Create the availability data with the correct format
    const availabilityData = [{
      startDate: this.selectedDateRange.startDate,
      endDate: this.selectedDateRange.endDate,
      isAvailable: this.selectedAvailability,
      specialPrice: formData.pricePerNight
    }];

    // Using forkJoin to handle both operations concurrently
    this.subscriptions.add(
      forkJoin({
        listingUpdate: this.listingsService.updateListing(this.listingId, listing),
        availabilityUpdate: this.availabilityCalendarService.setAvailabilityCalendarBatch(this.listingId, availabilityData)
      }).subscribe({
        next: () => {
          const newPhotos = this.uploadedImages.filter(img => img.file !== null);
          if (newPhotos.length > 0) {
            this.uploadImages(this.listingId);
          } else {
            this.updateListingStatus(this.listingId);
          }
        },
        error: (error) => {
          console.error('Error updating listing:', error);
          this.formErrors['submit'] = 'Failed to update listing. Please try again.';
          this.isLoading = false;
        }
      })
    );
  }

  private updateListingStatus(listingId: string) {
    console.log('Updating listing status to PENDING for ID:', listingId);
    this.subscriptions.add(
      this.listingsService.updateListingStatus(listingId, { verificationStatusId: 2 }).subscribe({
        next: () => {
          console.log('Listing status updated to PENDING');
          this.isLoading = false;
          this.router.navigateByUrl('/hosting/listings');
        },
        error: (error) => {
          console.log('Error updating listing status', error.error.message);
          this.formErrors['submit'] = 'Failed to update listing status';
          this.isLoading = false;
        }
      })
    );
  }

  private uploadImages(listingId: string): void {
    this.isLoading = true;
    // Only process new photos
    const newPhotos = this.uploadedImages.filter(img => img.file !== null);
    if (newPhotos.length === 0) {
      this.updateListingStatus(listingId);
      return;
    }

    // Map photos for upload
    const photosToUpload = newPhotos.map(img => ({
      file: img.file as File,
      caption: img.caption || 'Image Caption'
    }));

    // Update listing photos
    this.listingsService.updateListingPhotos(listingId, photosToUpload).subscribe({
      next: () => {
        console.log('Images uploaded successfully');
        this.updateListingStatus(listingId);
      },
      error: (error: any) => {
        console.error('Error uploading images', error);
        this.formErrors['submit'] = 'Failed to upload images. Please try again.';
        this.isLoading = false;
      }
    });
  }

  markFormGroupTouched(formGroup: FormGroup) {
    Object.values(formGroup.controls).forEach(control => {
      control.markAsTouched();

      if (control instanceof FormGroup) {
        this.markFormGroupTouched(control);
      }
    });
  }

  ngOnDestroy(): void {
    this.subscriptions.unsubscribe();
  }
}



