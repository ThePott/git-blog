# 하흥주

Frontend Developer

---

## 본질과 명확함을 추구하는 개발자

입시 학원 강사로 4년 6개월 재직하며, 진도와 오답 관리의 비효율을 직접 경험했습니다. 구글 시트와 파이썬으로 자체 시스템을
만들어 사용했지만, 수기 동기화에 학생당 5분씩 소요되는 한계가 있었습니다. 이 문제를 해결하고자 프론트엔드 개발을 배웠고,
해당 시스템을 웹앱으로 제작했습니다.

인프런은 "성장기회의 평등"이라는 미션 아래 150만 명 이상의 사용자에게 학습 환경을 제공하고 있습니다. 저 역시 학습의
비효율을 기술로 해결한 경험이 있기에, 인프런의 미션에 깊이 공감합니다. 트렌드보다 본질, 복잡함보다 명확함을 추구하며,
문제를 정확히 정의하고 단순한 해결책을 만드는 개발자가 되고자 합니다.

---

## 보유 기술

### Frontend

- React, TypeScript, Vite, Bun
- TanStack Query, Router, Table, Virtual
- Zustand, Zod

### Backend

- Express.js, Prisma, PostgreSQL

### Deployment

- Railway, S3, CloudFront

---

## 프로젝트

### Arbor The Tree - 진도 및 오답 관리 시스템

2025.11 ~ 2026.03 | https://github.com/ThePott/arbor-the-tree

#### 해결한 문제

- 기존 파이썬 시스템: 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
- 강사의 기억에 의존하던 진도 추적 → 자동화된 진도 관리로 전환
- 학생에게만 맡기던 오답 관리 → 시스템으로 추적 가능하게 개선

#### 주요 성과

- 서버 응답 속도 7초 → 0.3초로 단축 (22배 향상)
    - Neon DB의 cold start, region 문제 분석 후 Railway PostgreSQL로 교체
    - API와 DB를 동일 internal network에 배포하여 round-trip latency 최소화
- 그리드 입력 반응 시간 20.38ms → 2.28ms로 단축 (89% 향상)
    - TanStack Virtual을 이용한 가상 스크롤로 DOM 노드 최소화
- PDF 생성 시간 단축 및 브라우저 부담 제거
    - 서버 사이드 Typst 컴파일 도입으로 react-pdf 대비 80쪽 기준 30.7% 단축
    - 브라우저 메인 스레드 점유 없이 PDF 생성

#### 기술적 해결

- **컴포넌트별 Zustand 스토어**: Context API 대신 createStore 팩토리 패턴으로 props-drilling, re-render 문제 해결
- **커스텀 배포 스크립트**: npm install로 설치되지 않는 Typst compiler, font 파일을 Railway 배포 시 자동 설치

#### 사용 기술

React, TypeScript, TanStack Query/Router/Virtual, Zustand, Express.js, Prisma, PostgreSQL, Railway

---

### Harpooning Tmux - 생산성 향상 도구

https://github.com/ThePott/harpooning-tmux

#### 해결한 문제

- tmux 세션 순서 변경 불가 문제
- 새 프로젝트를 tmux 세션으로 등록하는 반복 작업

#### 주요 성과

- 새 프로젝트 세션 등록 시간 20초 → 2초로 단축 (10배 향상)
    - fzf를 이용해 .git/ 디렉토리만 검색, 선택 시 자동 세션 추가

---

## 교육

### 고려대학교

경제학과 | 2013.03 ~ 2020.02

### 오즈 코딩 스쿨

프론트엔드 코스 (6개월) | 2025.05 ~ 2025.11

- React, Node.js, PostgreSQL 학습

---

## 경력

### 입시 수학 학원 강사

4년 6개월 재직

- 자체 제작 진도 및 오답 관리 시스템으로 차별화된 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

---

## 연락처

- 010-6332-9205
- nusilite@gmail.com
- https://github.com/thepott
