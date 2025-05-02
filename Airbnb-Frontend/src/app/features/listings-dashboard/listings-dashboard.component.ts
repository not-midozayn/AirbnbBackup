import { Component, OnDestroy, OnInit } from '@angular/core';
import { TableModule } from 'primeng/table';
import { Tag } from 'primeng/tag';
import { Rating } from 'primeng/rating';
import { CommonModule, CurrencyPipe } from '@angular/common';
import { ButtonModule } from 'primeng/button';
import { MessageService, ConfirmationService } from 'primeng/api';
import { ToastModule } from 'primeng/toast';
import { TableRowCollapseEvent, TableRowExpandEvent } from 'primeng/table';
import { Listing } from '../../core/models/Listing';
import { ListingsService } from '../../core/services/listings.service';
import { Subscription } from 'rxjs';
import { FormsModule } from '@angular/forms';
import { ConfirmDialogModule } from 'primeng/confirmdialog';
import { ImagesService } from '../../core/services/images.service';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { InputTextModule } from 'primeng/inputtext';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-listings-dashboard',
  standalone: true,
  imports: [
    CurrencyPipe,
    TableModule,
    CommonModule,
    ButtonModule,
    Rating,
    ToastModule,
    FormsModule,
    ConfirmDialogModule,
    IconFieldModule,
    InputIconModule,
    InputTextModule,
    RouterModule
  ],
  providers: [MessageService, ConfirmationService],
  templateUrl: './listings-dashboard.component.html',
  styleUrl: './listings-dashboard.component.css',
})
export class ListingsDashboardComponent implements OnInit, OnDestroy {
  listings: Listing[] = [] as Listing[];
  subscription: Subscription = new Subscription();
  isLoading: boolean = false;
  expandedRows = {};
  searchValue: string | undefined;

  constructor(
    private listingsService: ListingsService,
    private messageService: MessageService,
    private confirmationService: ConfirmationService,
    public imgService: ImagesService
  ) {}

  ngOnInit() {
    this.GetListings();
  }

  GetListings() {
    this.isLoading = true;
    this.subscription.add(
      this.listingsService.getListings().subscribe({
        next: (data) => {
          this.listings = data;
          this.isLoading = false;
        },
        error: (err) => {
          console.error(err);
          this.isLoading = false;
        },
      })
    );
  }

  DeleteListing(id: string) {
    console.log(id);
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete this listing?',
      header: 'Delete Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.subscription.add(
          this.listingsService.deleteListing(id).subscribe({
            next: () => {
              this.GetListings();
            },
            error: (err) => {
              console.error(err);
            }
          })
        );
      }
    });
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

  updateListingStatus(id: string, status: number) {
    this.isLoading = true;
    console.log(status);
    this.subscription.add(
      this.listingsService.updateListingStatus(id, {verificationStatusId: status}).subscribe({
        next: () => {
          this.isLoading = false;
          this.GetListings();
          console.log('Listing status updated');
        },
        error: (err) => {
          console.log(err.error);
          this.isLoading = false;
        },
      })
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }


  // expandAll() {
  //   this.expandedRows = this.listings.reduce(
  //     (acc, listing) => (acc[listing.id] = true) && acc,
  //     {}
  //   );
  // }

  // collapseAll() {
  //   this.expandedRows = {};
  // }

  // getSeverity(status: string) {
  //   switch (status) {
  //     case 'INSTOCK':
  //       return 'success';
  //     case 'LOWSTOCK':
  //       return 'warn';
  //     case 'OUTOFSTOCK':
  //       return 'danger';
  //     default:
  //       return undefined;
  //   }
  // }

  // getStatusSeverity(status: string) {
  //   switch (status) {
  //     case 'PENDING':
  //       return 'warn';
  //     case 'DELIVERED':
  //       return 'success';
  //     case 'CANCELLED':
  //       return 'danger';
  //     default:
  //       return undefined;
  //   }
  // }

  // onRowExpand(event: TableRowExpandEvent) {
  //   this.messageService.add({
  //     severity: 'info',
  //     summary: 'Product Expanded',
  //     detail: event.data.name,
  //     life: 3000,
  //   });
  // }

  // onRowCollapse(event: TableRowCollapseEvent) {
  //   this.messageService.add({
  //     severity: 'success',
  //     summary: 'Product Collapsed',
  //     detail: event.data.name,
  //     life: 3000,
  //   });
  // }
}
