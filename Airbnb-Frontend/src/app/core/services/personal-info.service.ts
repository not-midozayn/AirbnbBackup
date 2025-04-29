import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { User } from '../models/user';

@Injectable({
  providedIn: 'root'
})
export class PersonalInfoService {

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
}
