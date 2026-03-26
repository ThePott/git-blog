#import "./components/page-setting/index.typ": page-setting
#import "./chapters/projects/arbor-the-tree/index.typ": chapter-project-arbor-the-tree

#show: page-setting

= 하흥주
== 프론트엔드 개발자
=== 포트폴리오

#pagebreak()

= 기술 스택

== client
- React with Vite, Bun
- TanStack Query, Router, Table, Virtual
- Zod
- Zustand

== api
- Express.js
- Prisma, PostgreSQL

== deployment
- Railway
- S3, CloudFront

== documentation
- Typst

= 주요 프로젝트
== Arbor The Tree - 진도 및 오답 관리 시스템
== IUA React UI - 디자인 라이브러리
== Terminal To Blog - 자동 업데이트 블로그

#pagebreak()
#chapter-project-arbor-the-tree

#pagebreak()
= IUA React UI - 디자인 라이브러리
== 기획 의도
=== 개발 초기 단계에서 공통 컴포넌트를 개발하는 시간을 단축하기 위해, 이전 프로젝트의 공통 컴포넌트를 npm 패키지로 배포
=== 컬러 테마 뿐 아니라 세부 로직도 사용자가 자유롭게 바꿀 수 있게 제작
== 주요 기능
=== 커스터마이징 가능한 컬러 스킴
=== 사용자가 세세하게 변경할 수 있도록 node_modules에가 아닌 utils 폴더에 해당 컴포넌트 파일이 노출된 채 복사되도록 npx 명령어 제작
=== 컴포넌트별 페이지를 만들어 각 속성에 따른 생김새 변화를 확인
== 주요 기능 외 해결한 문제
=== TanStack Router CLI 가 아무것도 하지 않고 바로 종료되는 버그 발견, 수정 후 PR, 현재 병합 대기 중

#pagebreak()
= Terminal To Blog - 자동 업데이트 블로그
== 기획 의도
=== 모든 문서 작업을 터미널에서 하되, 터미널에 익숙하지 않은 사람도 쉽게 열람할 수 있는 블로그 제작
=== source of truth를 깃헙 레포로 하여 블로그의 내용을 자동 업데이트
=== IUA React UI의 실사용
== 주요 기능
=== 동적 라우팅을 통해 레포 내에서의 새로운 폴더 생성을 자동으로 반영하여 새 라우트 제작
