import { Component, OnDestroy, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { Router, RouterModule } from '@angular/router';
import { ModalService } from '../../core/services/modal.service';
import { Subscription } from 'rxjs';
import { AuthService } from '../../core/services/auth.service';
import { ResponseUser } from '../../core/models/responseUser';
import { AppComponent } from '../../app.component';
 import { HeaderComponent } from '../../shared/components/header/header.component';


@Component({
  selector: 'app-login',
  imports: [ReactiveFormsModule, RouterModule],
  templateUrl: './login.component.html',
  styleUrl: './login.component.css'
})
export class LoginComponent implements OnInit, OnDestroy {
  loginForm: FormGroup = new FormGroup({});
  isLoading = false;
  isModalOpen = false;
  subscription: Subscription = new Subscription();
  loginError: string | null = null;
  constructor(private fb: FormBuilder, private router: Router, private modalService: ModalService, private authService: AuthService  ) {}

  ngOnInit(): void {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.pattern('^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};\':"\\\\|,.<>\\/?]).{3,}$')]],
    });

    this.subscription = this.modalService.loginModal$.subscribe(isOpen => {
      this.isModalOpen = isOpen;
      if (isOpen) {
        this.loginError = '';
        this.loginForm.reset();
      }
    });
  }

  closeModal() {
    this.modalService.closeLoginModal();
  }

  closeModalOnBackdrop(event: MouseEvent) {
    if (event.target === event.currentTarget) {
      this.closeModal();
    }
  }

  onSubmit() {
    if (this.loginForm.invalid) {
      return;
    }

    this.isLoading = true;
    this.loginError = '';

    this.subscription.add(
      this.authService.login(this.loginForm.value).subscribe({
        next: (response) => {
          console.log(response);
          localStorage.setItem('accessToken', (response.accessToken));
          localStorage.setItem('refreshToken', (response.refreshToken));
          this.authService.isLoggedIn = true;
          this.authService.isLoggedInSubject.next(true);
          this.isLoading = false;

          console.log("token data: ",this.authService.getAccessTokenData());
          console.log(this.authService.getAccessTokenClaim('http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'));
          this.authService.currentUserSignal.set({
            id: this.authService.getAccessTokenClaim('http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'),
            firstName: this.authService.getAccessTokenClaim('FirstName'),
            lastName: this.authService.getAccessTokenClaim('LastName'),
            email: this.authService.getAccessTokenClaim('http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'),
            roles: this.authService.getAccessTokenClaim('roles')
          });

          this.isLoading = false;
          this.closeModal();
          this.router.navigateByUrl('/Account', { skipLocationChange: true }).then(() => {
            this.router.navigate(['/home']);
          });
        },
        error: (error) => {
          this.loginError = error.error.message;
          this.isLoading = false;
          if (error.status === 401) {
            this.loginError = 'Invalid email or password';
          } else {
            this.loginError = 'An error occurred during login. Please try again.';
          }
        }
      })
    );
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
