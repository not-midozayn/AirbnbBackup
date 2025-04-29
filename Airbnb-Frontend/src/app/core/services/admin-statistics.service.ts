import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})

export class AdminStatisticsService {
  // URL for your backend API that returns chart data
  private apiUrl = 'https://localhost:7200/api/statistics';

  constructor(private http: HttpClient) {}
  getStatistics(endpoint: string): Observable<any> {
    return this.http.get<any>(`${this.apiUrl}/${endpoint}`);
  }
  // Method to fetch chart data
  getNewBookingsVsCancellations(period:string,year:number): Observable<any> {
    return this.getStatistics(`bookings?period=${period}&year=${year}`);  // Calling the generic method for bookings
  }
  getRevenue(period:string,year:number): Observable<any> {
    return this.getStatistics(`revenue?period=${period}&year=${year}`);  // Calling the generic method for revenue
  }
  getUserDistribution(): Observable<any> {
    return this.getStatistics('role-distribution');
  }
  getTopHosts(year:number): Observable<any> {
    return this.getStatistics(`top-hosts?year=${year}`);  // Calling the generic method for top hosts
  }
  getTopRatedListings(year:number): Observable<any> {
    return this.getStatistics(`top-listings?year=${year}`);
  }
  getSummaryMetrics(period: string, year: number): Observable<any> {
    return this.getStatistics(`summary-metrics?period=${period}&year=${year}`);
  }

}
