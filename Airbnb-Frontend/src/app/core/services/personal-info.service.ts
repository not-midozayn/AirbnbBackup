import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, Subject } from 'rxjs';
import { User } from '../models/user';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PersonalInfoService {

  private profilePictureUpdated = new Subject<string>();
  profilePictureUpdated$ = this.profilePictureUpdated.asObservable();

  constructor(private _HttpClient:HttpClient) { }


  getMyPersonalInfo():Observable<any>{
   return this._HttpClient.get('https://localhost:7200/api/users/me')
  }

  changeMyPassword(oldpass:string,newPassword:string,confirmPassword:string):Observable<any>{
    return this._HttpClient.post('https://localhost:7200/api/Authentication/change-password',{
      "currentPassword": oldpass ,
      "newPassword": newPassword ,
      "confirmPassword": confirmPassword
    })
  }


  changeMyPersonalData(user:User):Observable<any>{
    return this._HttpClient.put('https://localhost:7200/api/users/me',user)
  }

  changeProfilePicture(file: File): Observable<any> {
    const formData = new FormData();
    formData.append('file', file, file.name);
    return this._HttpClient.post('https://localhost:7200/api/users/me/profile-picture', formData);
  }


  notifyProfilePictureUpdated(url: string) {
    this.profilePictureUpdated.next(url);
  }

}
