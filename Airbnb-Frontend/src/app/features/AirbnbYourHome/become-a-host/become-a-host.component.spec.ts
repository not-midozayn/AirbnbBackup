import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BecomeAHostComponent } from './become-a-host.component';

describe('BecomeAHostComponent', () => {
  let component: BecomeAHostComponent;
  let fixture: ComponentFixture<BecomeAHostComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BecomeAHostComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BecomeAHostComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
