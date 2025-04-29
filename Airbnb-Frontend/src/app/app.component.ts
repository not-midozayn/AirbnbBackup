import { Component, OnDestroy, OnInit, ViewChild } from '@angular/core';
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { HeaderComponent } from "./shared/components/header/header.component";
import { FooterComponent } from "./shared/components/footer/footer.component";
import { LoginComponent } from "./features/login/login.component";
import { RegisterComponent } from "./features/register/register.component";
import { AuthService } from './core/services/auth.service';
import { Subscription } from 'rxjs';
import { CarouselBasicDemo } from "./features/property-type/property-type.component";
import { LeafletMapComponent } from "./features/leaflet-map/leaflet-map.component";
import { HomeComponent } from './features/home/home.component';



@Component({
  selector: 'app-root',
  standalone:true,
  imports: [RouterOutlet, FooterComponent, HeaderComponent, LoginComponent, RegisterComponent , CarouselBasicDemo, LeafletMapComponent],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent implements OnInit, OnDestroy {
  title = 'Airbnb';
  showHeader: boolean = true;
  showFooter: boolean = true;
  userId!: string;
  firstName!: string;
  lastName!: string;
  role!: string;
  subscription: Subscription = new Subscription();
  @ViewChild(HomeComponent) homeComponent!: HomeComponent;
  constructor(private router: Router, private authService: AuthService){
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.showHeader = !event.url.includes('/dashboard') && !event.url.includes('/hosting');
        this.showFooter = !event.url.includes('/become-a-host');
      }
    });
  }

  ngOnInit(): void {
    // this.subscription.add(
    //   this.authService.getCurrentUser().subscribe((user => {
    //     console.log("current user data signal: ",this.authService.currentUserSignal());
    //   }))
    // )
  }

  ngOnDestroy(): void {
    // this.subscription.unsubscribe();
  }
}
