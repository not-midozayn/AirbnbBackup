import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { Router, NavigationEnd } from '@angular/router';

export interface NavItem {
  path: string;
  label: string;
  active: boolean;
}

@Injectable({
  providedIn: 'root'
})
export class NavigationService {
  private navItems: NavItem[] = [
    { path: 'today', label: 'Today', active: true },
    { path: 'calendar', label: 'Calendar', active: false },
    { path: 'listings', label: 'Listings', active: false },
    { path: 'messages', label: 'Messages', active: false }
  ];

  private navItemsSubject = new BehaviorSubject<NavItem[]>(this.navItems);
  navItems$ = this.navItemsSubject.asObservable();

  constructor(private router: Router) {
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.updateActiveState(event.url);
      }
    });
  }

  private updateActiveState(currentUrl: string) {
    const updatedItems = this.navItems.map(item => {
      const itemPath = item.path.startsWith('/') ? item.path : `/${item.path}`;
      const isActive = currentUrl === itemPath ||
        (itemPath !== '/hosting' && currentUrl.startsWith(itemPath));
      return {
        ...item,
        active: isActive
      };
    });

    this.navItems = updatedItems;
    this.navItemsSubject.next(updatedItems);
  }

  getNavItems(): NavItem[] {
    return this.navItems;
  }
}
