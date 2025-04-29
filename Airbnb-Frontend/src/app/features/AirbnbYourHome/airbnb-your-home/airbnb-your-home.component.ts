import { Component } from '@angular/core';
import { AirbnbYourHomeHeaderComponent } from "../airbnb-your-home-header/airbnb-your-home-header.component";
import { NavigationEnd, Router, RouterOutlet } from '@angular/router';
import { ChatBotComponent } from '../../chat-bot/chat-bot.component';

@Component({
  selector: 'app-airbnb-your-home',
  imports: [AirbnbYourHomeHeaderComponent, RouterOutlet, ChatBotComponent],
  templateUrl: './airbnb-your-home.component.html',
  styleUrl: './airbnb-your-home.component.css'
})
export class AirbnbYourHomeComponent {
  showHeader: boolean = true;
  constructor(private router: Router){
    this.router.events.subscribe(event => {
      if (event instanceof NavigationEnd) {
        this.showHeader = !event.url.includes('/become-a-host');
      }
    });
  }
}
