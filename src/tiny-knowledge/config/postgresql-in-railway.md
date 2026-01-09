# railway에 postgresql 배포하기

- 프로젝트에서 "Add Database -> PostgreSQL"
- region: singapore로 수정
- DATABASE_URL -> railway api에 적용
- DATABASE_PUBLIC_URL -> local api에 적용
- `npx prisma migrate deploy`
- 개발 클라이언트에서 로그아웃 -> 로그인 -> 데이터 생성 시도
- 배포 클라이언트에서 정상 작동 확인하기
