import { ComponentFixture, TestBed } from '@angular/core/testing';

import { HostDraftsComponent } from './host-drafts.component';

describe('HostDraftsComponent', () => {
  let component: HostDraftsComponent;
  let fixture: ComponentFixture<HostDraftsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [HostDraftsComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(HostDraftsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
