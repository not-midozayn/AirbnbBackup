import { Component, OnDestroy, OnInit } from '@angular/core';
import { RegisterModalService } from '../../core/services/register-modal.service';
import { FormBuilder, FormGroup, FormsModule, ReactiveFormsModule, Validators } from '@angular/forms';
import { Subscription } from 'rxjs';
import { RouterModule } from '@angular/router';
import { FloatLabelModule } from 'primeng/floatlabel';
import { passwordMatchValidator } from '../../core/CrossFieldValidation/passwordMatchValidator';
import { AuthService } from '../../core/services/auth.service';
import { ModalService } from '../../core/services/modal.service';

@Component({
  selector: 'app-register',
  imports: [ReactiveFormsModule, RouterModule, FormsModule, FloatLabelModule],
  templateUrl: './register.component.html',
  styleUrl: './register.component.css'
})
export class RegisterComponent implements OnInit, OnDestroy {
  constructor(private registermodalService: RegisterModalService, private loginmodalServic: ModalService, private fb: FormBuilder, private authService: AuthService) { }
  isModalOpen = false; // Track the modal state
  registerForm: FormGroup = new FormGroup({}); // Initialize the form group
  subscription: Subscription = new Subscription(); // Initialize the subscription
  isLoading = false; // Track loading state
  value: string = ''; // Initialize value for the input field
  registerError: string = ''; // Initialize error message for registration


  ngOnInit(): void {
    this.subscription = this.registermodalService.registerModal$.subscribe(isOpen => {
      this.isModalOpen = isOpen;
    });
    this.registerForm = this.fb.group(
      {
        firstName: ['', [Validators.required, Validators.minLength(3)]],
        lastName: ['', [Validators.required, Validators.minLength(3)]],
        birthDate: ['', [Validators.required]],
        email: ['', [Validators.required, Validators.email]],
        password: ['', [Validators.required, Validators.pattern('^(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*()_+\\-=\\[\\]{};\':"\\\\|,.<>\\/?]).{3,}$')]],
        confirmPassword: ['', [Validators.required]],
      }, {
      validators: passwordMatchValidator()
    });
  }

  closeRegisterModal() {
    this.registermodalService.closeRegisterModal();
  }
  closeModalOnBackdrop(event: MouseEvent) {
    if (event.target === event.currentTarget) {
      this.closeRegisterModal();
    }
  }

  onSubmit() {
    this.isLoading = true;
    this.subscription = this.authService.register(this.registerForm.value).subscribe({
      next: (response) => {
        console.log('Registration successful:', response);
        this.closeRegisterModal();
        this.loginmodalServic.openLoginModal();
        this.registerForm.reset();
        this.isLoading = false;
      },
      error: (error) => {
        this.registerError = error.error.message;
        this.isLoading = false;
      }
    });
  }

  ngOnDestroy(): void {
    this.subscription.unsubscribe();
  }

}
