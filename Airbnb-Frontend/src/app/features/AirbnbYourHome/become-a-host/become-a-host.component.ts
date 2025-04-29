import { Component } from '@angular/core';
import {  RouterOutlet } from '@angular/router';
import { HostHeaderComponent } from "../host-header/host-header.component";

@Component({
  selector: 'app-become-a-host',
  standalone: true,
  imports: [ HostHeaderComponent, RouterOutlet],
  templateUrl: './become-a-host.component.html',
  styleUrl: './become-a-host.component.css'
})
export class BecomeAHostComponent {

}
