import { TestBed } from '@angular/core/testing';

import { AuthStatusService } from './auth-status-service.service';

describe('AuthStatusServiceService', () => {
  let service: AuthStatusService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AuthStatusService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
