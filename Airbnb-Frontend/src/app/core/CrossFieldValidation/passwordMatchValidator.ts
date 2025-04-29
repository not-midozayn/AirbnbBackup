import { AbstractControl, ValidatorFn } from '@angular/forms';

// Custom validator function to check if passwords match
export function passwordMatchValidator(): ValidatorFn {
  return (control: AbstractControl): {[key: string]: any} | null => {
    const password = control.get('password');
    const confirmPassword = control.get('confirmPassword');

    // Return null if controls haven't initialized yet, or if there's no value
    if (!password || !confirmPassword) {
      return null;
    }

    // Return null if another validator has already found an error on the matchingControl
    if (confirmPassword.errors && !confirmPassword.errors['passwordMismatch']) {
      return null;
    }

    // Return error if passwords don't match
    if (password.value !== confirmPassword.value) {
      confirmPassword.setErrors({ passwordMismatch: true });
      return { passwordMismatch: true };
    } else {
      confirmPassword.setErrors(null);
      return null;
    }
  };
}
