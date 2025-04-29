import { HttpInterceptorFn } from '@angular/common/http';

export const authInterceptor: HttpInterceptorFn = (req, next) => {
  const accessToken = localStorage.getItem('accessToken');

  // Skip requests if token is missing or route is public
  if (!accessToken || isPublicRequest(req.url)) {
    return next(req);
  }

  // Add Authorization header
  const authReq = req.clone({
    setHeaders: {
      Authorization: `Bearer ${accessToken}`,
    },
  });

  return next(authReq);
};

// Helper: check if route is public
function isPublicRequest(url: string): boolean {
  return url.includes('/login') || url.includes('/register');
}
