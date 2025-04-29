import { Component, OnDestroy, OnInit } from '@angular/core';
import { ListingsService } from '../../../core/services/listings.service';
import { Subscription } from 'rxjs';
import { Listing } from '../../../core/models/Listing';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { AuthService } from '../../../core/services/auth.service';

@Component({
  selector: 'app-host-drafts',
  imports: [CommonModule, RouterModule],
  templateUrl: './host-drafts.component.html',
  styleUrl: './host-drafts.component.css'
})
export class HostDraftsComponent implements OnInit, OnDestroy {
  isLoading = false;
  error: string | null = null;
  private subscription = new Subscription();

  constructor(public listingsService: ListingsService, public authService: AuthService) {}

  ngOnInit() {
    this.isLoading = true;
    console.log("curent draft", this.authService.currentUserSignal());
    this.subscription.add(
      this.listingsService.getEmptyListingsByHostId(this.authService.currentUserSignal()?.id ?? "").subscribe({
        next: (listings) => {
          this.isLoading = false;
        },
        error: (error) => {
          console.log('Error fetching listings:', error);
          this.isLoading = false;
        }
      })
    );
  }

  createDraftListing() {
    this.isLoading = true;
    this.subscription.add(
      this.listingsService.createEmptyListing().subscribe({
        next: (newListing) => {
          this.isLoading = false;
        },
        error: (error) => {
          this.isLoading = false;
          console.log('Error creating draft listing:', error);
        }
      })
    )
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
