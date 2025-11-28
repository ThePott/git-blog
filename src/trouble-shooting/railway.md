## 배포 시 `Application Failed to Respond`

- 발생일: 2025-11-28
- 문제: Railway로 리액트 배포 실패
- 오류

```
Application failed to respond
This error appears to be caused by the application.

If this is your project, check out your deploy logs to see what went wrong. Refer to our docs on Fixing Common Errors for
help, or reach out over our Help Station.

If you are a visitor, please contact the application owner or try again later.

Request ID:
-hoOf7d-SYms_4GOAQeqjw

Go to Railway
```

- 원인 파악: 5173은 Vite 로컬 서버의 포트 번호이지 Railway에서 사용하는 포트 번호가 아니었음
- 해결: placeholder로 있던 8080을 사용
- 소요 시간: 10분
