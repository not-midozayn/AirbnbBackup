import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AirbnbYourHomeComponent } from './airbnb-your-home.component';

describe('AirbnbYourHomeComponent', () => {
  let component: AirbnbYourHomeComponent;
  let fixture: ComponentFixture<AirbnbYourHomeComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AirbnbYourHomeComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AirbnbYourHomeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
