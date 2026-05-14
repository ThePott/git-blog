# 하흥주

Frontend Developer

---

## 본질과 명료함을 추구하는 개발자

입시 학원 강사로 4년 6개월 재직하며, 진도와 오답 관리의 비효율을 직접 경험했습니다. 구글 시트와 파이썬으로 자체 시스템을
만들어 사용했지만, 수기 동기화에 학생당 5분씩 소요되는 한계가 있었습니다. 이 문제를 해결하고자 프론트엔드 개발을 배웠고,
해당 시스템을 웹앱으로 제작했습니다.

인프런은 "성장기회의 평등"이라는 미션 아래 150만 명 이상의 사용자에게 학습 환경을 제공하고 있습니다. 저 역시 학습의
비효율을 기술로 해결한 경험이 있기에, 인프런의 미션에 깊이 공감합니다. 트렌드보다 본질, 복잡함보다 명료함을 추구하며,
문제를 정확히 정의하고 단순한 해결책을 만드는 개발자가 되고자 합니다.

---

## 보유 기술

### Frontend

- React, TypeScript, Vite, Bun
- TanStack Query, Router, Table, Virtual
- Zustand, Zod
- 반응형 웹 개발

### Backend

- Express.js, Prisma, PostgreSQL
- RESTful API 설계

### Deployment

- Railway, S3, CloudFront

### Collaboration

- Git Flow (main/develop/feature branch 전략)
- GitHub PR 기반 코드리뷰

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
- 모바일 사용자 경험 고려한 반응형 구현 (랜딩, 회원가입, 권한 요청 페이지)

#### 기술적 해결

- **컴포넌트별 Zustand 스토어**: Context API 대신 createStore 팩토리 패턴으로 props-drilling, re-render 문제 해결
- **커스텀 배포 스크립트**: npm install로 설치되지 않는 Typst compiler, font 파일을 Railway 배포 시 자동 설치
- **RESTful API 설계**: 프론트엔드와 분리된 API 서버 구축 (https://github.com/ThePott/api-of-arbor-the-tree)

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
- 2회 팀 프로젝트 팀장 수행, PR 기반 코드리뷰 주도

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

## 변경 사항 요약

### 1. 보유 기술 섹션 추가

**변경 전:**

```markdown
### Frontend

- React, TypeScript, Vite, Bun
- TanStack Query, Router, Table, Virtual
- Zustand, Zod
```

**변경 후:**

```markdown
### Frontend

- React, TypeScript, Vite, Bun
- TanStack Query, Router, Table, Virtual
- Zustand, Zod
- 반응형 웹 개발

### Backend

- Express.js, Prisma, PostgreSQL
- RESTful API 설계

### Collaboration

- Git Flow (main/develop/feature branch 전략)
- GitHub PR 기반 코드리뷰
```

**이유:**

- 채용공고 자격요건: "Git과 Github에 대한 기본적인 사용법을 알고 있고, Git Flow를 이해하고 계신 분"
- 채용공고 자격요건: "HTTP 통신에 대한 기본적인 이해, RESTful API에 대한 설계나 개발 경험"
- 채용공고 자격요건: "반응형 웹 개발에 대한 이해가 있으신 분"
- 채용공고 우대사항: "코드리뷰(온라인 PR, 오프라인 페어프로그래밍)를 통해 함께 성장하는 문화"

위 요구사항들을 보유 기술에 명시하여 자격요건 충족을 한눈에 보여줍니다.

---

### 2. Arbor The Tree 프로젝트 - 반응형 웹 성과 추가

**추가 내용:**

```markdown
- 모바일 사용자 경험 고려한 반응형 구현 (랜딩, 회원가입, 권한 요청 페이지)
```

**이유:**

- 채용공고: "반응형 웹 개발에 대한 이해가 있으신 분"
- 실제 사용자(학생, 원장)의 모바일 사용 시나리오를 고려한 구현 경험은 "User-Centric" 관점을 보여줍니다.

---

### 3. Arbor The Tree 프로젝트 - RESTful API 설계 추가

**추가 내용:**

```markdown
- **RESTful API 설계**: 프론트엔드와 분리된 API 서버 구축 (https://github.com/ThePott/api-of-arbor-the-tree)
```

**이유:**

- 채용공고: "HTTP 통신에 대한 기본적인 이해, RESTful API에 대한 설계나 개발 경험이 있으신 분"
- API 서버를 별도 레포지토리로 관리한 점은 관심사 분리(Separation of Concerns)를 실천했음을 보여줍니다.

---

### 4. 교육 섹션 - 코드리뷰 경험 추가

**변경 전:**

```markdown
### 오즈 코딩 스쿨

프론트엔드 코스 (6개월) | 2025.05 ~ 2025.11

- React, Node.js, PostgreSQL 학습
```

**변경 후:**

```markdown
### 오즈 코딩 스쿨

프론트엔드 코스 (6개월) | 2025.05 ~ 2025.11

- React, Node.js, PostgreSQL 학습
- 2회 팀 프로젝트 팀장 수행, PR 기반 코드리뷰 주도
```

**이유:**

- 채용공고 우대사항 中 소통과 투명성: "문서화를 통해 지식을 팀에 공유하시는 분"
- 채용공고 주요업무: "코드리뷰(온라인 PR, 오프라인 페어프로그래밍)를 통해 함께 성장하는 문화를 만들어 갑니다"
- 팀장으로서 코드리뷰를 주도한 경험은 협업 역량과 리더십을 보여줍니다.

---

## 추가하지 않은 내용과 이유

### SSR 경험

- 개념적 이해는 있으나 Next.js 등 실무 경험이 없으므로 추가하지 않았습니다.
- Zig/Raylib/Clay WASM 학습 중인 내용은 인프런 채용과 직접 연관이 없어 제외했습니다.

### 코드리뷰 상세 내용

- "로직/버그 점검, 리팩토링 제안, 공통 컴포넌트 사용 제안" 등 상세 내용은 면접에서 설명할 소재로 남겨두었습니다.
- 이력서는 간결하게, 면접에서 구체적으로 설명하는 것이 효과적입니다.

---

## 최종 매칭 분석

| 채용공고 요구사항       | 이력서 매칭                             |
| ----------------------- | --------------------------------------- |
| TypeScript 이해         | ✅ 보유 기술 명시                       |
| React 기반 개발 경험    | ✅ Arbor The Tree 프로젝트              |
| HTML, CSS 마크업 이해   | ✅ 반응형 웹 개발 추가                  |
| SSR, CSR 이해           | △ 개념적 이해 (명시하지 않음)           |
| HTTP/RESTful API 경험   | ✅ RESTful API 설계 추가, API 서버 링크 |
| 반응형 웹 개발 이해     | ✅ 보유 기술 + 프로젝트 성과에 추가     |
| Git/GitHub, Git Flow    | ✅ Collaboration 섹션 추가              |
| TanStack Query (우대)   | ✅ 보유 기술 + 프로젝트에서 활용        |
| Vite (우대)             | ✅ 보유 기술 명시                       |
| 코드리뷰 문화 (우대)    | ✅ 교육 섹션에 추가                     |
| 성능 최적화 (우대)      | ✅ 22배, 89% 향상 정량적 수치           |
| 본인 서비스 운영 (우대) | ✅ 실제 학원용 시스템 제작              |

---

## 결론

답변 내용을 반영하여 다음 4가지를 추가했습니다:

1. **반응형 웹 개발** - 보유 기술 + 프로젝트 성과
2. **RESTful API 설계** - 보유 기술 + 프로젝트 기술적 해결 + API 서버 링크
3. **Git Flow** - Collaboration 섹션 신설
4. **코드리뷰 경험** - 교육 섹션에 팀장/코드리뷰 주도 경험 추가

이로써 채용공고의 자격요건을 모두 충족하고, 우대사항도 대부분 매칭되는 이력서가 완성되었습니다.
