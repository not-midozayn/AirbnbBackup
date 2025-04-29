import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HostTodayComponent } from './host-today.component';

describe('HostTodayComponent', () => {
  let component: HostTodayComponent;
  let fixture: ComponentFixture<HostTodayComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HostTodayComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HostTodayComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
