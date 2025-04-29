import { Component, OnDestroy, OnInit } from '@angular/core';
import { Table } from 'primeng/table';
import { TagModule } from 'primeng/tag';
import { IconFieldModule } from 'primeng/iconfield';
import { InputIconModule } from 'primeng/inputicon';
import { InputTextModule } from 'primeng/inputtext';
import { CommonModule } from '@angular/common';
import { TableModule } from 'primeng/table';
import { ButtonModule } from 'primeng/button';
import { Representative, User } from '../../core/models/user';
import { UserService } from '../../core/services/user.service';
import { FormsModule } from '@angular/forms';
import { ConfirmDialog, ConfirmDialogModule } from 'primeng/confirmdialog';
import { ConfirmationService } from 'primeng/api';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-users-dashboard',
  standalone: true,
  imports: [
    TableModule,
    CommonModule,
    InputTextModule,
    TagModule,
    ButtonModule,
    IconFieldModule,
    InputIconModule,
    FormsModule,
    ConfirmDialogModule,
    ConfirmDialog
  ],
  providers: [ConfirmationService],
  templateUrl: './users-dashboard.component.html',
  styleUrl: './users-dashboard.component.css'
})
export class UsersDashboardComponent implements OnInit, OnDestroy {
  users: User[] = [];
  loading = false;
  searchValue: string | undefined;
  subscription: Subscription = new Subscription();

  constructor(private userService: UserService, private confirmationService: ConfirmationService) {}

  ngOnInit() {
    this.GetUsers();
  }

  GetUsers() {
    this.loading = true;
    this.subscription = this.userService.getUsers().subscribe({
      next: (data) => {
        this.users = data;
        this.loading = false;
      },
      error: (err) => {
        console.error(err);
        this.loading = false;
      }
    });
  }

  DeleteUser(id: string) {
    this.confirmationService.confirm({
      message: 'Are you sure you want to delete this user?',
      header: 'Delete Confirmation',
      icon: 'pi pi-exclamation-triangle',
      accept: () => {
        this.userService.deleteUser(id).subscribe({
          next: () => {
            this.GetUsers();
          },
          error: (err) => {
            console.error(err);
          }
        });
      }
    });
  }

  clear(table: Table) {
    table.clear();
    this.searchValue = '';
  }

  getSeverity(status: string): 'success' | 'info' | undefined {
    switch (status) {
      case "Guest":
        return 'success';
      case "Host":
        return 'info';
      default:
        return undefined;
    }
  }

  ngOnDestroy() {
    this.subscription.unsubscribe();
  }
}
