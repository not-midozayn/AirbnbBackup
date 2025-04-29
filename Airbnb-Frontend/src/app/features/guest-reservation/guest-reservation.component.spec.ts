import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GuestReservationsComponent } from './guest-reservations.component';

describe('GuestReservationsComponent', () => {
  let component: GuestReservationsComponent;
  let fixture: ComponentFixture<GuestReservationsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [GuestReservationsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(GuestReservationsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
