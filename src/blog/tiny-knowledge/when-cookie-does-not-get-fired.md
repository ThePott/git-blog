# 쿠키가 안 날라간다면

## 확인: Network => header => cookie ?

## SameSite

- Lax: GET 에는 쿠키 담는다. 그 외에는 안 담는다 (relax)
- Strict: SameSite의 쿠키만 담는다
- None: 어디서든 쿠키 담는다. (Secure=True 필수)
