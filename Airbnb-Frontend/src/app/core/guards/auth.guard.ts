import { inject } from "@angular/core";
import { AuthService } from "../services/auth.service";
import { ModalService } from "../services/modal.service";
import { Router } from "@angular/router";
import { catchError, map, of } from "rxjs";

export const authGuard = () => {
  const authService = inject(AuthService);
  const router = inject(Router);
  const loginModal = inject(ModalService);
  const currUser = authService.currentUserSignal();

  console.log("Signal value in guard:", currUser);

  // If we already have user data in the signal
  if (currUser && !authService.isTokenExpired()) {
    return true;
  }

  // If user is explicitly set to null (logged out)
  if (currUser === null) {
    loginModal.openLoginModal();
    return router.navigateByUrl("/home");
  }

  // If undefined (not yet loaded), try to load it
  // and return an observable for the router to wait on
  const token = authService.getAccessToken();
  if (!token) {
    loginModal.openLoginModal();
    return router.navigateByUrl("/home");
  }

  // We have a token but no user data yet, fetch it
  return authService.getCurrentUser().pipe(
    map(user => {
      if (user) {
        return true;
      } else {
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
