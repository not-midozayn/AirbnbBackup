import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HostListingComponent } from './host-listing.component';

describe('HostListingComponent', () => {
  let component: HostListingComponent;
  let fixture: ComponentFixture<HostListingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HostListingComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HostListingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
