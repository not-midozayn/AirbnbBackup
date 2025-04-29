// leaflet-map.component.ts
import { Component, AfterViewInit, OnDestroy, Input, OnChanges, SimpleChanges } from '@angular/core';
import { CommonModule } from '@angular/common';
import * as L from 'leaflet';

@Component({
  selector: 'app-leaflet-map',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './leaflet-map.component.html',
  styleUrls: ['./leaflet-map.component.css']
})
export class LeafletMapComponent implements AfterViewInit, OnDestroy, OnChanges {
  @Input() latitude: number = 51.505; // Default center (London)
  @Input() longitude: number = -0.09; // Default center (London)
  @Input() markerImageUrl: string = 'assets/images/custom-marker.png';
  
  private map!: L.Map;
  private marker!: L.Marker;
  private defaultZoom = 15;

  constructor() {}

  ngOnChanges(changes: SimpleChanges): void {
    // Update map if coordinates change and map is already initialized
    if ((changes['latitude'] || changes['longitude']) && this.map) {
      this.updateMapView();
    }
  }

  ngAfterViewInit(): void {
    this.initializeMap();
  }

  ngOnDestroy(): void {
    if (this.map) {
      this.map.remove();
    }
  }

  private initializeMap(): void {
    if (!document.getElementById('map')) {
      // Wait for DOM to be ready
      setTimeout(() => this.initializeMap(), 100);
      return;
    }

    this.map = L.map('map', {
      center: [this.latitude, this.longitude],
      zoom: this.defaultZoom
    });

    // Add OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      maxZoom: 19,
      attribution: '© <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(this.map);

    // Add a marker
    this.addMarker();
    
    // Fix map size issues that might occur
    setTimeout(() => {
      this.map.invalidateSize();
    }, 300);
  }

  private addMarker(): void {
    if (!this.map) return;
    
    // Remove existing marker if any
    if (this.marker) {
      this.map.removeLayer(this.marker);
    }
    
    // Create custom icon if image URL is provided
    const icon = this.markerImageUrl ? 
      L.icon({
        iconUrl: this.markerImageUrl,
        iconSize: [40, 40],
        iconAnchor: [20, 40],
        popupAnchor: [0, -35]
      }) : 
      undefined;
    
    // Add marker with custom icon or default icon
    this.marker = L.marker([this.latitude, this.longitude], {
      icon: icon
    }).addTo(this.map);
  }

  private updateMapView(): void {
    if (!this.map) return;
    
    // Update map center
    this.map.setView([this.latitude, this.longitude], this.defaultZoom);
    
    // Update marker position
    this.addMarker();
    
    // Invalidate size to handle any rendering issues
    setTimeout(() => {
      this.map.invalidateSize();
    }, 300);
  }
}