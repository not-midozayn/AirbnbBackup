import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListingsDashboardComponent } from './listings-dashboard.component';

describe('ListingsDashboardComponent', () => {
  let component: ListingsDashboardComponent;
  let fixture: ComponentFixture<ListingsDashboardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ListingsDashboardComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListingsDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
