import { Injectable } from '@angular/core';
import { Subject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class SearchService {
  private searchParamsSource = new Subject<{ Location: string; startDate: string; endDate: string; Guests:number }>();

  searchParams$ = this.searchParamsSource.asObservable();

  emitSearchParams(params: { Location: string; startDate: string; endDate: string; Guests:number }) {
    this.searchParamsSource.next(params);
  }
}
