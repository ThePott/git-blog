# troubleshooting: 서버 응답 시간 단축

## 최초 서버 구성

- api server: deployed in Railway
- db: Neon(PostgreSQL)

### 문제

- 문제집 등록 시, 7초 가량이 걸림
- 연속적으로 요청 보낼 시, 응답 시간이 4~5초로 줄어듦

## 진단

- cold start: 최초 응답에서만 시간이 많이 걸린다
- far region: 적은 데이터만 요청 보내도 오래 걸린다
- railway의 region을 한국과 제일 가까운 싱가폴로 변경
    - 응답 시간 차이 없음
- Neon은 변경할 수 있는 설정이 없음
    - 무료 플랜에선 cold start 강제됨
    - region은 N. Virginia 하나

### 결론

- Neon을 교체해야 한다

## 해결 및 성과

- Railway에 PostgeSQL 서버 배포
    - API와 DB를 같은 internal server에 배포하여 round-trip latency 최소화
- 문제집 생성 시간 315 ms로 단축 (22배 향상)
