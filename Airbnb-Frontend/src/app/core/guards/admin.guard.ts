import { inject } from '@angular/core';
import { AuthService } from './../services/auth.service';
import { Router } from '@angular/router';
import { ModalService } from '../services/modal.service';
import { catchError, map, of } from 'rxjs';

export const adminGuard = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const loginModal = inject(ModalService);
  const currentUser = authService.currentUserSignal();

  const checkIfAdmin = (user: any) => {
    const roles = authService.getAccessTokenClaim("roles");
    // Check if the user is an admin based on a role claim or property
    const isAdmin = roles.includes("Admin") || user.isAdmin === true;

    if (isAdmin) {
      return true;
    }
    console.log("Not an admin");
    return router.createUrlTree(['/home']);
  };

    // Check if user exists
    if (currentUser) {
      // Check if user is an admin
      // Assuming your user object has a role property
      if (checkIfAdmin(currentUser)) {
        return true;
      }

      // User exists but is not an admin
      return router.navigateByUrl("/home");
    }

    // If user is explicitly set to null (logged out)
    if (currentUser === null) {
      loginModal.openLoginModal();
      return router.navigateByUrl("/home");
    }

    // If undefined (not yet loaded), try to load it
    const token = authService.getAccessToken();
    if (!token) {
      loginModal.openLoginModal();
      return router.navigateByUrl("/home");
    }

    // We have a token but no user data yet, fetch it
    return authService.getCurrentUser().pipe(
      map(user => {
        if (user) {
          authService.currentUserSignal.set(user);
          return checkIfAdmin(user);
        } else {
          // No user data returned
          loginModal.openLoginModal();
          return router.navigateByUrl("/home");
        }
      }),
      catchError(() => {
        loginModal.openLoginModal();
        return of(router.navigateByUrl("/home"));
      })
    );
};
