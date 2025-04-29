import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardSideMenuComponent } from './dashboard-side-menu.component';

describe('DashboardSideMenuComponent', () => {
  let component: DashboardSideMenuComponent;
  let fixture: ComponentFixture<DashboardSideMenuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardSideMenuComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DashboardSideMenuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
