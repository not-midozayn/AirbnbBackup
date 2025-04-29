import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AirbnbYourHomeHeaderComponent } from './airbnb-your-home-header.component';

describe('AirbnbYourHomeHeaderComponent', () => {
  let component: AirbnbYourHomeHeaderComponent;
  let fixture: ComponentFixture<AirbnbYourHomeHeaderComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AirbnbYourHomeHeaderComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AirbnbYourHomeHeaderComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
