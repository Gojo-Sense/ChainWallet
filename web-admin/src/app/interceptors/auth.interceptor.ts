import { HttpInterceptorFn, HttpErrorResponse, HttpRequest, HttpHandlerFn, HttpEvent } from '@angular/common/http';
import { inject } from '@angular/core';
import { catchError, switchMap, throwError, Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';
import { Router } from '@angular/router';

let isRefreshing = false;
let refreshTokenSubject: any = null;

export const authInterceptor: HttpInterceptorFn = (req: HttpRequest<unknown>, next: HttpHandlerFn): Observable<HttpEvent<unknown>> => {
  const authService = inject(AuthService);
  const router = inject(Router);

  // Skip auth for login/register endpoints
  if (req.url.includes('/auth/login') || req.url.includes('/auth/register')) {
    return next(req);
  }

  // Add token to request
  const token = authService.getAccessToken();
  if (token) {
    req = req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`
      }
    });
  }

  return next(req).pipe(
    catchError((error: HttpErrorResponse) => {
      // Handle 401 Unauthorized
      if (error.status === 401 && !req.url.includes('/auth/refresh')) {
        if (!isRefreshing) {
          isRefreshing = true;
          refreshTokenSubject = null;

          const refreshToken = authService.getRefreshToken();
          if (refreshToken) {
            return authService.refreshToken().pipe(
              switchMap((response: any) => {
                isRefreshing = false;
                refreshTokenSubject = response.data.accessToken;

                // Retry original request with new token
                const clonedReq = req.clone({
                  setHeaders: {
                    Authorization: `Bearer ${response.data.accessToken}`
                  }
                });
                return next(clonedReq);
              }),
              catchError((refreshError) => {
                isRefreshing = false;
                authService.logout().subscribe();
                return throwError(() => refreshError);
              })
            );
          } else {
            isRefreshing = false;
            authService.logout().subscribe();
            return throwError(() => error);
          }
        } else {
          // Wait for token refresh
          return refreshTokenSubject.pipe(
            switchMap((newToken: string) => {
              const clonedReq = req.clone({
                setHeaders: {
                  Authorization: `Bearer ${newToken}`
                }
              });
              return next(clonedReq);
            })
          );
        }
      }

      return throwError(() => error);
    })
  ) as Observable<HttpEvent<unknown>>;
};