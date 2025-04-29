import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AuthStatusService {
  isLoggedInSignal = signal(false);

  setLoggedIn() {
    this.isLoggedInSignal.set(true);
  }

  setLoggedOut() {
    this.isLoggedInSignal.set(false);
  }
}
