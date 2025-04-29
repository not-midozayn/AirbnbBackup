import { Component, inject } from '@angular/core';
import { PersonalInfoService } from '../../core/services/personal-info.service';
import { User } from '../../core/models/user';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';

interface PersonalInfoField {
  name: string;
  label: string;
  value: string;
  placeholder: string;
  type: string;
}

interface PersonalInfoSection {
  title: string;
  fields: PersonalInfoField[];
  editMode: boolean;
  description?: string; 
}

@Component({
  selector: 'app-personal-info',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './personal-info.component.html',
  styleUrls: ['./personal-info.component.css']
})
export class PersonalInfoComponent {
  userData: User = {} as User;
  originalUserData: User = {} as User;
  loading: boolean = false;
  successMessage: string = '';
  errorMessage: string = '';



  personalInfoSections: PersonalInfoSection[] = [];

  constructor(private _PersonalInfoService: PersonalInfoService) {}

  ngOnInit(): void {
    this.getMyPersonalInfo();
  }

  getMyPersonalInfo() {
    this.loading = true;
    this._PersonalInfoService.getMyPersonalInfo().subscribe({
      next: (res: User) => {
        this.userData = res;
        this.originalUserData = { ...res };
        this.initPersonalInfoSections();
        this.loading = false;
      },
      error: (err) => {
        console.log(err);
        this.errorMessage = 'Failed to load personal information. Please try again.';
        this.loading = false;
      }
    });
  }

  initPersonalInfoSections() {
    this.personalInfoSections = [
      {
        title: 'Legal name',
        description: 'This is the name on your travel document, which could be a license or a passport.',
        editMode: false,
        fields: [
          { name: 'firstName', label: 'First name', value: this.userData.firstName || '', placeholder: 'First name', type: 'text' },
          { name: 'lastName', label: 'Last name', value: this.userData.lastName || '', placeholder: 'Last name', type: 'text' },
        ]
      },
      {
        title: 'Email address',
        description: 'Use an address you will always have access to.',
        editMode: false,
        fields: [
          { name: 'email', label: 'Email', value: this.userData.email || '', placeholder: 'Email', type: 'email' }
        ]
      },
      {
        title: 'Phone numbers',
        description: 'Add a number for verification purposes.',
        editMode: false,
        fields: [
          { name: 'phoneNumber', label: 'Phone number', value: this.userData.phoneNumber || '', placeholder: this.userData.phoneNumber, type: 'tel' }
        ]
      },
      {
        title: 'Password',
        description: 'Keep your account secure with a strong password.',
        editMode: false,
        fields: [
          { name: 'currentPassword', label: 'Current password', value: '', placeholder: 'Current password', type: 'password' },
          { name: 'newPassword', label: 'New password', value: '', placeholder: 'New password', type: 'password' },
          { name: 'confirmPassword', label: 'Confirm new password', value: '', placeholder: 'Confirm new password', type: 'password' }
        ]
      },
      {
        title: 'Personal info',
        description: 'This information will be used to verify your identity.',
        editMode: false,
        fields: [
          { name: 'dateOfBirth', label: 'Date of birth', value: this.userData.dateOfBirth || '', placeholder: 'Date of birth', type: 'date' }
        ]
      },
    //   {
    //   title: 'Gender',
    //   description: 'Tell Us about your Gender',
    //   editMode: false,
    //   fields: [
    //     { name: 'Gender', label: 'Gender', value: this.userData.email || '', placeholder: 'Gender', type: 'Gender' }
    //   ]
    // }
      
    ];
  }

  editSection(section: PersonalInfoSection) {
    // Reset all other sections first
    this.personalInfoSections.forEach(s => {
      if (s !== section) s.editMode = false;
    });
    section.editMode = true;
  }

  cancelEdit(section: PersonalInfoSection) {
    section.editMode = false;
    this.errorMessage = '';
    this.successMessage = '';
    this.initPersonalInfoSections(); // reset values from originalUserData
  }

  saveSection(section: PersonalInfoSection) {
    this.loading = true;
    this.errorMessage = '';
    this.successMessage = '';

    if (section.title === 'Password') {
      const oldPass = section.fields.find(f => f.name === 'currentPassword')?.value || '';
      const newPass = section.fields.find(f => f.name === 'newPassword')?.value || '';
      const confirmPass = section.fields.find(f => f.name === 'confirmPassword')?.value || '';
      
      if (newPass !== confirmPass) {
        this.errorMessage = 'New passwords do not match';
        this.loading = false;
        return;
      }
      
      this.changepassword(oldPass, newPass, confirmPass);
      return;
    }

    // Update userData from fields
    section.fields.forEach(field => {
      (this.userData as any)[field.name] = field.value;
    });

    console.log('Updated userData:', this.userData);

    // Send update
    this.changeMyPersonalData(this.userData);
  }

  changeMyPersonalData(user: User) {

    console.log('Sending to server:', user);

    this._PersonalInfoService.changeMyPersonalData(user).subscribe({
      next: (res) => {
        this.userData = res;
        this.originalUserData = { ...res };
        this.initPersonalInfoSections();
        this.successMessage = 'Your information has been updated successfully';
        this.loading = false;
        
        // Reset edit mode for all sections
        this.personalInfoSections.forEach(s => s.editMode = false);
      },
      error: (err) => {
        console.log(err);
        this.errorMessage = 'Failed to update your information. Please try again.';
        this.loading = false;
      }
    });
  }

  changepassword(oldPassword: string, newPassword: string, confirmPassword: string) {
    this._PersonalInfoService.changeMyPassword(oldPassword, newPassword, confirmPassword).subscribe({
      next: (res) => {
        this.successMessage = 'Password updated successfully';
        this.loading = false;
        
        // Reset password fields
        const passwordSection = this.personalInfoSections.find(s => s.title === 'Password');
        if (passwordSection) {
          passwordSection.editMode = false;
          passwordSection.fields.forEach(field => field.value = '');
        }
      },
      error: (err) => {
        console.log(err);
        this.errorMessage = err?.error?.message || 'Failed to update password. Please try again.';
        this.loading = false;
      }
    });
  }
}