import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class RegisterModalService {
  private registerModalSubject = new BehaviorSubject<boolean>(false);
  registerModal$ = this.registerModalSubject.asObservable();

  openRegisterModal() {
    this.registerModalSubject.next(true);
    document.body.style.overflow = 'hidden';
  }
  closeRegisterModal() {
    this.registerModalSubject.next(false);
    document.body.style.overflow = '';
  }

}
