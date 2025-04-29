import { Routes } from '@angular/router';
import { authGuard } from './core/guards/auth.guard';
import { hostGuard } from './core/guards/host.guard';
import { adminGuard } from './core/guards/admin.guard';
import { PaymentSuccessComponent } from './features/payment-success/payment-success.component';
import { PaymentFailedComponent } from './features/payment-failed/payment-failed.component';

export const routes: Routes = [
  { path: "", redirectTo: "home", pathMatch: 'full' },
  { path: "home", loadComponent: () => import('./features/home/home.component').then(m => m.HomeComponent), title: "home" },
  // {path:"login", loadComponent:() => import('./features/login/login.component').then(m => m.LoginComponent), title:"login"},
  // {path:"register", loadComponent:() => import('./features/register/register.component').then(m => m.RegisterComponent), title:"register"},
  {path:"listing-details/:listId", loadComponent:() => import('./features/listing-details/listing-details.component').then(m => m.ListingDetailsComponent), title:"Listing-Details"},

  {
    path: "hosting",
    loadComponent: () => import('./features/AirbnbYourHome/airbnb-your-home/airbnb-your-home.component').then(m => m.AirbnbYourHomeComponent),
    title: "hosting",
    canActivate: [() => authGuard(), () => hostGuard()],
    children: [
      { path: "today", loadComponent: () => import('./features/AirbnbYourHome/host-today/host-today.component').then(m => m.HostTodayComponent), title: "today" },
      { path: "listings", loadComponent: () => import('./features/AirbnbYourHome/host-listing/host-listing.component').then(m => m.HostListingComponent), title: "listings" },
      {
        path: "become-a-host", loadComponent: () => import('./features/AirbnbYourHome/become-a-host/become-a-host.component').then(m => m.BecomeAHostComponent), title: "become-a-host",
        children: [
          { path: "", loadComponent: () => import('./features/AirbnbYourHome/host-drafts/host-drafts.component').then(m => m.HostDraftsComponent), title: "host-drafts" },
          { path: ":id", loadComponent: () => import('./features/AirbnbYourHome/add-listing/add-listing.component').then(m => m.AddListingComponent), title: "add-listing" },
        ]
      },
      { path: "", redirectTo: "today", pathMatch: 'full' },
    ]
  },
  { path: "dashboard", loadComponent: () => import('./features/dashboard/dashboard.component').then(m => m.DashboardComponent), title: "dashboard", canActivate: [() => authGuard(), () => adminGuard()] },
  {path:"wishlist", loadComponent:() => import('./features/wishlist/wishlist.component').then(m => m.WishlistComponent), title:"WishList", canActivate: [() => authGuard()]},
  {path:"Account", loadComponent:() => import('./features/account-settings/account-settings.component').then(m => m.AccountComponent), title:"Account"},
  { path: "conversations", loadComponent: () => import('./features/conversations/conversations.component').then(m => m.ConversationsComponent), title: "conversations", canActivate: [() => authGuard()] },
  {path:"Account/personal-info", loadComponent:() => import('./features/personal-info/personal-info.component').then(m => m.PersonalInfoComponent), title:"Personal-Info"},
  { path: 'payment-success', component: PaymentSuccessComponent },
  { path: 'payment-cancelled', component: PaymentFailedComponent },
  {path:"**", redirectTo:"home" , pathMatch:'full'  } // Wildcard route for a 404 page
];
