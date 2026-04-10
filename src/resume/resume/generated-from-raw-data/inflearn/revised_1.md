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

---

---

# 첨삭 내용 및 이유

## 1. 전체적으로 잘 작성된 부분

현재 이력서는 인프런 채용공고와 높은 적합도를 보입니다:

- **TanStack Query 사용 경험**: 채용공고에서 "TanStack Query를 활용한 서버 상태 관리" 우대사항과 직접 매칭
- **TypeScript + React 기반**: 핵심 자격요건 충족
- **성능 최적화 경험**: 응답 속도 22배 향상, 렌더링 89% 개선 등 정량적 성과
- **사용자 문제 해결 경험**: 학습 관련 도메인에서 비효율을 기술로 해결한 스토리가 인프런의 "성장기회의 평등" 미션과
  연결됨

## 2. 첨삭이 필요 없는 이유

원본 generated.md를 검토한 결과, **현재 상태로도 충분히 경쟁력 있는 이력서**입니다:

### 채용공고 매칭 분석

| 채용공고 요구사항       | 이력서 내용                           |
| ----------------------- | ------------------------------------- |
| TypeScript 이해         | React, TypeScript, Vite, Bun ✅       |
| React 기반 개발 경험    | Arbor The Tree 프로젝트 ✅            |
| TanStack Query 활용     | TanStack Query/Router/Virtual 사용 ✅ |
| Git/GitHub 사용         | GitHub 링크 포함 ✅                   |
| 성능 개선 경험          | 22배, 89% 성능 향상 수치 ✅           |
| 본인이 만든 서비스 운영 | 실제 학원에서 사용할 시스템 제작 ✅   |

### 우대사항 키워드 매칭

- **Vite**: 보유 기술에 명시 ✅
- **Zustand**: 컴포넌트별 스토어 패턴 설명 ✅
- **성능 최적화**: Lighthouse 등은 없지만, 가상 스크롤, 응답 속도 개선 경험 ✅
- **팀의 비효율 개선**: Harpooning Tmux로 반복 작업 자동화 ✅

## 3. 추가 고려사항 (선택적)

아래 내용은 추가하면 좋지만, **없는 사실을 만들면 안 되므로** 해당 경험이 있는 경우에만 추가하세요:

### 3-1. 다음 경험이 있다면 추가 권장

1. **반응형 웹 개발 경험**: Arbor The Tree가 반응형으로 구현되었다면 명시
    - 3-2 대답 참고
2. **SSR/CSR 이해**: Vite를 사용했지만 SSR 경험이 있다면 추가
    - 개념적 이해는 하나, Next.js등의 SSR 경험은 없음
    - 개인적 철학으로는 태고부터 가능했던 SSR을, CSR을 뒤틀어서 하는 것보단 처음부터 SSR인 것으로 하는 게 낫지 않겠냐
      싶어 Zig, Raylib, Clay를 이용한 WASM을 공부중
3. **코드리뷰 경험**: 부트캠프에서 팀 프로젝트 코드리뷰 경험이 있다면 추가
    - 3-2 대답 참고
4. **Git Flow 사용**: feature branch, PR 기반 개발 경험이 있다면 추가
    - 3-2 대답 참고

### 3-2. 질문

다음 경험이 있다면 알려주세요. 이력서에 추가할 수 있습니다:

1. Arbor The Tree는 반응형(모바일 대응)으로 구현되었나요?
    - 일부 화면 구현됨: 모바일로 사용해야 하는 부분
        - 랜딩 페이지
        - 회원가입 페이지 (학생이 모바일로 가입할 것)
        - 권한 요청 현황 페이지 (원장이 모바일로 승인할 수 있어야 함)
        - 이후 진도표, 오답체크 페이지도 학생이 이용하기 쉽게 모바일 대응을 하려고 했으나, 중간에 원장의 일방적 계약
          취소로 진행하지 않음
2. 부트캠프에서 팀 프로젝트 시 코드리뷰를 진행한 경험이 있나요?
    - 부트캠프 중 2개월 간 2번의 팀 프로젝트가 있었고 모두 팀장을 맡아 주도적으로 코드 리뷰를 함
        - 로직, 버그 점검
        - 더 나은 패턴, 혹은 리팩토링 제안
        - 공통 컴포넌트 사용, custom css variable 사용 제안으로 일관된 코드 스타일 유지
3. Git branch 전략(Git Flow 등)을 사용한 경험이 있나요?
    - 팀 프로젝트: main, develop, feature branch로 구분하여 작업
    - 단독 프로젝트: main, develop으로 구분하여 작업
        - 혼자 하여 feature -> develop PR 불필요
        - 다만 혼자 하더라도 main(deployed), develop 은 구분, develop -> PR -> main으로 main에 병합하여 혹시 모를 충돌
          방지
4. HTTP 통신, RESTful API 설계에 대한 이해를 보여줄 수 있는 내용이 있나요? (예: Arbor The Tree의 API 엔드포인트 설계
   경험)
    - api server project: https://github.com/ThePott/api-of-arbor-the-tree

## 4. 결론

**현재 이력서는 인프런 프론트엔드 개발자 채용공고에 잘 맞춰져 있습니다.**

특히 다음 포인트가 강점입니다:

- 학습 도메인에서 비효율을 기술로 해결한 스토리 → 인프런의 미션과 자연스럽게 연결
- TanStack 생태계 활용 경험 → 채용공고의 핵심 기술 스택과 일치
- 정량적 성과(22배, 89% 향상) → 채용공고의 "성능 개선 경험" 우대사항 충족

위 3-2의 질문에 대한 답변을 주시면, 해당 내용을 반영하여 추가 첨삭을 진행하겠습니다.
