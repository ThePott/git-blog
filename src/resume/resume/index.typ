#set text(
  font: "Noto Serif KR", // fallback chain
  size: 11pt,
)
#set page(
  paper: "a4",
)
#set heading(numbering: "1.A.a.i)")

#let personal-info = [
  - 고려대학교 경제학과
  - {private info phone number}
  - {private info email}
  - https://github.com/ThePott
  - {deployed blog url}
]

#let profile-image = figure(
  image("../../../assets/dog.png", width: 25%),
)

= 하흥주

#stack(
  dir: ltr,
  personal-info,
  h(1fr),
  profile-image,
)

== 학원 시스템 개발자
입시 학원 강사의 수업은 강사의 기억력과 그날의 컨디션에 좌우됩니다. 저는 수학 강사로 재직하는 4년 반 동안, 구글 스프레드
시트에 학생 오답을 기록하고 파이썬의 pandas로 추출, 조작하였고 덕분에 수업 품질을 일관되게 유지했습니다. 더 많은 사람이
이 시스템의 혜택을 보게 하고자 해당 시스템을 리액트로 만들었고 이는 전 재직 학원에서 실제로 사용을 하고 있습니다. 이제
더 다양한 도구들을 만들어 더 많은 사람을 돕고 싶습니다.


#pagebreak()


== 핵심 프로젝트

=== 스터디 커뮤니티 StudyHub 강의, 공고 파트

==== 개발 기간: 2025.10 \~ 11

==== 링크

- (깃헙 링크) <<<< 시연영상 리드미에 넣어야

==== 메인 기술 스택

- React, TypeScript, TanStack Query, TailwincCSS, Node.js, express, Husky

==== 주요 업무

- 개발 규칙 제정 및 환경 구축
- 공통 컴포넌트 제작 및 사용법 작성
- 낙관적 업데이트를 쉽게 할 수 있는 공통 후크 제작
- 강의 목록 페이지, 알림 드롭다운, 공고 지원 폼 제작

==== 성과

- 코드 스플리팅을 통한 TTFB(Time To First Byte) ---- % 단축
- 캐시 저장과 낙관적 업데이트를 이용한 응답 속도 70% 단축
- 더미 서버를 구축하여 늦은 API 배포에 따른 개발 지연 최소화
- Husky를 이용해 언제나 배포 가능한 상태 유지



=== 아르보 수학학원 진도 관리 시스템

==== 링크

- repo-client: https://github.com/ThePott/arbor-the-tree
- repo-api: https://github.com/ThePott/api-of-arbor-the-tree
- deployed: https://arbor-the-tree-production.up.railway.app

==== 메인 기술 스택

- React, Tanstack Query, Tanstack Router, Tanstack Table, Tanstack Virtual, Railway, PostgreSQL

==== 주요 업무

- 기획
- 데이타베이스 설계
- 문제집의 모든 문제 좌표를 기입할 수 있는 데이타 테이블 제작
- 데스크탑, 모바일 환경에 대응하는 칸반 진도표

=== 개인 블로그: from terminal to blog

==== 개발 기간: 2025.11 ~ 현재

==== 링크

- (깃헙 주소)
- (배포 주소)

==== 메인 기술 스택

- React, Octokit, Tanstack Query, Tanstack Router, Railway, PostgreSQL

==== 주요 업무

- 터미널에서 NeoVim과 마크다운으로 작성한 포스트를, 다른 사람들이 쉽게 볼 수 있는 웹 앱 개발
- 더 빠른 타자 연습을 위한 목표 설정과 기록을 위한 DB 및 확인 인터페이스 구축

==== 성과

- 동적 라우팅을 이용한 라우터 구성으로 클라이언트 코드 최소화
- Monkeytype API의 한계를 극복하기 위한 자동 저장 데이타베이스 구축

=== 디자인 라이브러리 react-everforest-ui <<<< 여기서는 성과만 적는다

- 더 개발해서 react-thepott-ui로 한 다음 theme을 주입할 수 있게 하면 좋겠다 <<<< 사실 아직 아무것도 하지 않았지만

==== 개발 기간: 시작일 ~ 현재

==== 링크

- (깃헙 주소)
- npm 주소

==== 주요 업무

- 이전 프로젝트에서 제작한 공통 컴포넌트 모듈화
- 복잡한 컴포넌트에서 사용할, 컴포넌트별 스토어 제작
- npm 패키지 배포

==== 성과

- 새 프로젝트에서 공통 컴포넌트를 제작하는 데에 드는 시간(5일) 절감
- 사용자가 컴포넌트 커스터마이제이션을 모든 계층에서 할 수 있도록 node_module에 설치하는 게 아니라 프로젝트 src 폴더에
  파일을 생성하는 방식으로 설치
