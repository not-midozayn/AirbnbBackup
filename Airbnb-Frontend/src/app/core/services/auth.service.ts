import { HttpClient } from '@angular/common/http';
import { effect, Injectable, signal } from '@angular/core';
import { loginUser } from './../models/loginUser';
import { RegisterUser } from '../models/registerUser';
import { ResponseUser } from '../models/responseUser';
import { User } from '../models/user';
import { BehaviorSubject, catchError, of, tap } from 'rxjs';
import { Router } from '@angular/router';
import { AuthStatusService } from './auth-status-service.service';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  apiUrl = 'https://localhost:7200/api';
  currentUserSignal = signal<undefined | null | ResponseUser | User>(undefined);
  isLoggedIn = false;
  public isLoggedInSubject = new BehaviorSubject(this.isLoggedIn);
  constructor(private http: HttpClient, private router: Router , private authStatusService:AuthStatusService) {
    this.checkAuthStatus();
    // Setup effect to monitor token expiration
    effect(() => {
      const user = this.currentUserSignal();
      if (user && this.isTokenExpired()) {
        // Auto logout when token expires
        this.logout();
      }
    });
  }

  login(user: loginUser) {
     // this.authStatusService.setLoggedIn()

    return this.http.post<any>(`${this.apiUrl}/Authentication/login`, user);
  }

  register(user: RegisterUser) {
    return this.http.post<RegisterUser>(`${this.apiUrl}/Authentication/register`, user);
  }

  logout() {
    localStorage.removeItem('accessToken');
    localStorage.removeItem('refreshToken');
    this.currentUserSignal.set(null);
  }

  getCurrentUser() {
    return this.http.get<User>(`${this.apiUrl}/users/me`).pipe(
      tap((user) => {
        if(user) this.currentUserSignal.set(user);
      }),
      catchError((error) => {
        this.currentUserSignal.set(null);
        return of(null);
      })
    );
  }

  becomeAHost() {
    return this.http.post<{accessToken: string, refreshToken: string}>(`${this.apiUrl}/Authentication/BecomeAHost`, {}).pipe(
      tap((response) => {
        if(response) {
          console.log("response from become a host: ", response);
          localStorage.setItem('accessToken', (response.accessToken));
          localStorage.setItem('refreshToken', (response.refreshToken));
          console.log("token data: ", this.getAccessTokenData());
          this.currentUserSignal.set({
            id: this.getAccessTokenClaim('http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'),
            firstName: this.getAccessTokenClaim('FirstName'),
            lastName: this.getAccessTokenClaim('LastName'),
            email: this.getAccessTokenClaim('http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress'),
            roles: this.getAccessTokenClaim('roles')
          });
          console.log("current user data signal: ",this.currentUserSignal());
          this.router.navigate(['/hosting']);
        }
      })
    )
  }

  getAccessToken(): string | null {
    return localStorage.getItem('accessToken');
  }

  getRefreshToken(): string | null {
    return localStorage.getItem('refreshToken');
  }

  getAccessTokenData(): any {
    const token = this.getAccessToken();
    if (!token) return null;

    try {
      return JSON.parse(atob(token.split('.')[1]));
    } catch (error) {
      return null;
    }
  }

  getAccessTokenClaim(claimName: string): any {
    const tokenData = this.getAccessTokenData();
    return tokenData ? tokenData[claimName] : null;
  }

  isTokenExpired() {
    const tokenData = this.getAccessTokenData();
    const exp = this.getAccessTokenClaim("exp");
    if (!tokenData || !exp) return true;
    // exp is in seconds since epoch, Date.now() is in milliseconds
    return (tokenData.exp * 1000) < Date.now();
  }

  refreshToken() {
    const userId = this.getAccessTokenClaim("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier");
    const refreshToken = this.getRefreshToken();
    const accessToken = this.getAccessToken();
    if (!refreshToken) {
      this.logout();
      return of(null);
    }

    return this.http.post<any>(`${this.apiUrl}/Authentication/refresh-token`, { userId, accessToken, refreshToken })
      .pipe(
        tap(response => {
          if (response.accessToken) {
            localStorage.setItem('accessToken', response.accessToken);
            if (response.refreshToken) {
              localStorage.setItem('refreshToken', response.refreshToken);
            }
          }
        }),
        catchError(error => {
          this.logout();
          return of(null);
        })
      );
  }

  checkAuthStatus() {
    const token = this.getAccessToken();
    if (token && !this.isTokenExpired()) {
      this.getCurrentUser().subscribe();
    } else if (token && this.isTokenExpired()) {
      // Token is expired, attempt refresh or logout
      this.refreshToken().subscribe();
    } else {
      this.currentUserSignal.set(null);
    }
  }

}
