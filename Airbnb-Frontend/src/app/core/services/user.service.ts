import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { User } from '../models/user';
import { Observable, of } from 'rxjs';
import { catchError, map, tap } from 'rxjs/operators';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  apiurl = 'https://localhost:7200/api';
  constructor(private http: HttpClient, private authService: AuthService) {}

  getUsers() {
    return this.http.get<User[]>(`${this.apiurl}/users/all`).pipe(
      map(users => users.filter(user => user.id !== this.authService.currentUserSignal()?.id)),
      catchError((error) => {
        return of([] as User[]);
      })
    );
  }

  updateUser(user: User) {
    return this.http.put<User>(`${this.apiurl}/users/me`, user).pipe(
      tap(updatedUser => {
        if(updatedUser) this.authService.currentUserSignal.set(updatedUser);
      })
    )
  }

  deleteUser(id: string) {
    return this.http.delete<User>(`${this.apiurl}/users/${id}`);
  }

  // // Helper method to handle pagination
  // private getPagedUsers(count: number) {
  //   return this.getUsers().pipe(
  //     map(users => users.slice(0, count))
  //   ).toPromise();
  // }

  // getCustomersMini() {
  //   return this.getPagedUsers(5);
  // }

  // getCustomersSmall() {
  //   return this.getPagedUsers(10);
  // }

  // getCustomersMedium() {
  //   return this.getPagedUsers(50);
  // }

  // getCustomersLarge() {
  //   return this.getPagedUsers(200);
  // }

  // getCustomersXLarge() {
  //   return this.getUsers().toPromise();
  // }

  // getCustomers(params?: any) {
  //   return this.getUsers().pipe(
  //     map(users => params ? this.applyParams(users, params) : users)
  //   ).toPromise();
  // }

  // private applyParams(users: User[], params: any): User[] {
  //   // Add any filtering/sorting logic based on params here
  //   return users;
  // }

  // getCustomers(params?: any) {
    //   return this.http.get<any>('https://www.primefaces.org/data/customers', { params: params }).toPromise();
    // }

}
