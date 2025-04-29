import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ScrollService {
  private isScrollActive = signal<boolean>(true);  // flag to control scroll state

  // Function to stop the scroll
  stopScroll() {
    this.isScrollActive.set(false);
  }

  // Function to allow the scroll
  startScroll() {
    this.isScrollActive.set(true);
  }

  // Getter to check the scroll state
  getScrollState() {
    return this.isScrollActive();
  }
}
