import { Router } from "@angular/router";
import { AuthService } from "../services/auth.service";
import { inject } from "@angular/core";
import { ModalService } from "../services/modal.service";
import { catchError, map, of } from "rxjs";

export const hostGuard = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const loginModal = inject(ModalService);
  const currentUser = authService.currentUserSignal();

  const checkIfHost = (user: any) => {
    const roles = authService.getAccessTokenClaim("roles");
    // Check if the user is a host based on a role claim or property
    const isHost = roles.includes("Host") || user.isHost === true;

    if (isHost) {
      return true;
    }
    console.log("Not a host");
    return router.createUrlTree(['/home']);
  };

  if (currentUser) {
    // Already have user data, check if they're a host
    if (authService.isTokenExpired()) {
      loginModal.openLoginModal();
      return router.createUrlTree(['/home']);
    }
    return checkIfHost(currentUser);
  } else if (currentUser === null) {
    // User is explicitly logged out
    loginModal.openLoginModal();
    return router.createUrlTree(['/home']);
  } else {
    // User is undefined, need to fetch
    // Your interceptor will automatically add the token here
    return authService.getCurrentUser().pipe(
      map(user => {
        if (user) {
          authService.currentUserSignal.set(user);
          return checkIfHost(user);
        } else {
          loginModal.openLoginModal();
          return router.createUrlTree(['/home']);
        }
      }),
      catchError(() => {
        // If API call fails, likely unauthorized
        authService.logout();
        loginModal.openLoginModal();
        return of(router.createUrlTree(['/home']));
      })
    );
  }

};
