import { CommonModule } from '@angular/common';
import { Component, OnDestroy, OnInit } from '@angular/core';
import { ButtonModule } from 'primeng/button';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { InputTextModule } from 'primeng/inputtext';
import { Table, TableModule } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { ProgressBar } from 'primeng/progressbar';
import { MultiSelectModule } from 'primeng/multiselect';
import { SelectModule } from 'primeng/select';
import { FormsModule } from '@angular/forms';
import { Representative } from '../../../core/models/user';
import { ListingsService } from '../../../core/services/listings.service';
import { Listing } from '../../../core/models/Listing';
import { Subscription } from 'rxjs';
import { AddListingComponent } from '../add-listing/add-listing.component';
import { Router, RouterLink } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';
import { ImagesService } from '../../../core/services/images.service';
import { ConfirmDialog, ConfirmDialogModule } from 'primeng/confirmdialog';
import { ConfirmationService } from 'primeng/api';

@Component({
  selector: 'app-host-listing',
  imports: [
    TableModule,
    CommonModule,
    InputTextModule,
    TagModule,
    FormsModule,
    RouterLink,
    SelectModule,
    MultiSelectModule,
    ButtonModule,
    IconFieldModule,
    InputIconModule,
    ConfirmDialogModule,
  ],
  providers: [ConfirmationService, ImagesService],
  templateUrl: './host-listing.component.html',
  styleUrl: './host-listing.component.css',
})
export class HostListingComponent implements OnInit, OnDestroy {
  constructor(
    public listingsService: ListingsService,
    private authService: AuthService,
    public imgsService: ImagesService,
    private confirmationService: ConfirmationService,
    private router: Router
  ) {}
  representatives!: Representative[];
  statuses!: any[];
  loading: boolean = false;
  activityValues: number[] = [0, 100];
  searchValue: string | undefined;
  subscription: Subscription = new Subscription();

  ngOnInit() {
    this.loading = true;
    console.log(this.authService.currentUserSignal()?.id);
    this.getListingsByHostId(this.authService.currentUserSignal()?.id ?? '');
  }

  getListingsByHostId(hostId: string) {
    this.subscription.add(
      this.listingsService
        .getListingsByHostId(hostId)
        .subscribe({
          next: (listings) => {
            this.loading = false;
            console.log('Listings fetched successfully:', listings);
          },
          error: (error) => {
            console.log('Error fetching listings:', error);
            this.loading = false;
          },
        })
    );
  }

  DeleteListing(id: string) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete this listing?',
      header: 'Delete Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.subscription.add(
          this.listingsService.deleteListing(id).subscribe({
            next: (response) => {
              console.log('Listing deleted successfully');
              this.getListingsByHostId(this.authService.currentUserSignal()?.id ?? '');
            },
            error: (error) => {
              console.log('Error deleting listing:', error);
            },
          })
        );
      },
      reject: () => {
        // Handle rejection if needed
      },
    });
  }

  clear(table: Table) {
    table.clear();
    this.searchValue = '';
  }

  getStatus(statusNumber: number) {
    switch (statusNumber) {
      case 1:
        return 'In progress';

      case 2:
        return 'Action required';

      case 3:
        return 'Verified';

      case 4:
        return 'Rejected';

      default:
        return 'In progress';
    }
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
