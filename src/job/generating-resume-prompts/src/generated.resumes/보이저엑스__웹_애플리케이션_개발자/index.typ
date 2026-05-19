#import "./components/page_settings/index.typ": page_setting
#import "./components/dim_text/index.typ": dim_text
#import "./components/rem/index.typ": rem
#import "./components/hr/index.typ": hr
#import "./components/shadowed_round_box/index.typ": shadowed_round_box

#show: page_setting

#let additional_title(content) = text(size: rem(1.2), weight: "semibold", content)


#grid(
    columns: (1fr, 100pt),
    column-gutter: 20pt,
    [
        = 하흥주
        #v(rem(0.5))
        #additional_title("문제의 본질을 파악하는 웹 개발자")
        #v(rem(2))
        #dim_text[nusilite\@gmail.com]
        #v(rem(1))
        문제를 정확히 정의하고, 단순한 해결책을 만듭니다
    ],
    [
        #shadowed_round_box[
            #image("assets/nusilite.jpg")
        ]
    ],
)

== 자기소개

*보이저엑스 지원 동기*

인공지능 소프트웨어로 더 즐겁고 편리한 삶을 만든다는 보이저엑스 비전에 공감합니다. 본질과 명료함을 추구하는 저의 개발
철학과 딥러닝에 대한 믿음, 새로운 제품에 대한 모험심이 잘 맞다고 느꼈습니다.

학원 강사로서 문제의 본질을 파악하여 학생마다 다른 이해의 병목 지점을 찾고, 단순한 설명으로 문제를 해결했던 경험이
있습니다. 동일한 접근법을 웹 개발에 적용하여, Arbor The Tree 프로젝트에서 스프레드시트의 본질은 테이블이며, PDF의 본질은
브라우저와 무관한 문서임을 파악하고 단순한 해결책을 구현했습니다.

*문제 해결 접근법*

React와 TypeScript로 웹앱을 개발하며, 매번 "이 문제의 근본은 무엇인가"를 물었습니다. 스프레드시트 라이브러리 대신
TanStack Table을, 클라이언트 PDF 생성 대신 서버 사이드 Typst를 선택했습니다. 동영상 편집기 Vrew에서 FFmpeg, WebGL,
WebAudio 같은 기술이 어떻게 활용되는지 기대됩니다. 저의 본질 파악 능력과 단순한 해결책을 만드는 철학이 보이저엑스에서
가치를 만들 수 있다고 믿습니다.

== 기술 스택

React, TypeScript, TanStack Query, TanStack Router, Zustand, Vite, Express, PostgreSQL, Prisma, Git, AWS

== 프로젝트

=== Arbor The Tree 진도 관리 시스템
#dim_text("개인 프로젝트 (외주)\n2025. 11. ~ 2026. 04.")

#additional_title("복잡한 학원 운영을 단순한 시스템으로")


==== 해결한 문제
- 강사 기억에 의존한 진도 추적 → 칸반 보드 기반 진도표로 시각화
- 학생당 5분, 수업당 50\~100분 소요되던 수동 동기화 → 오답 체크 시 자동 반영
- CLI 기반 기존 시스템 → 아르바이트생도 사용 가능한 웹앱으로 전환

==== 기술적 해결
- 스프레드시트 → TanStack Table: 필요한 건 테이블 형식이지 스프레드시트가 아님을 파악, 자동완성/유효성 검사 직접 구현
- 드롭다운 잘림 문제: createPortal로 document.body에 렌더링, Floating UI로 위치 계산 (Reflow 이해)
- 다층 구조 가상 스크롤: book → topic → step → question 계층을 줄 단위로 평탄화 후 가상화
- 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, 한글 폰트를 Railway 배포 시 자동 설치
- async I/O: Express.js에서 비동기 처리, Railway + PostgreSQL 동일 private network로 지연 시간 최소화
- C++ 이해를 위한 저수준 접근: Typst 컴파일러를 bash 스크립트로 직접 설치, 폰트 경로 직접 설정

==== 주요 성과
- 서버 응답 속도 22배 향상 (7초 → 315ms)
    - 원인 분석: Neon DB cold start + far region (N. Virginia)
    - 해결: Railway PostgreSQL로 교체, 동일 private network 배포로 latency 최소화
- 그리드 입력 반응 시간 89% 단축 (20.28ms → 2.28ms)
    - TanStack Virtual로 2000행 x 6열 DOM 노드 가상화
- PDF 생성 시간 단축 및 브라우저 부담 제거
    - 서버 사이드 Typst 컴파일로 react-pdf 대비 800쪽 기준 61.3% 단축
    - 문제의 본질 파악: PDF는 브라우저와 무관한 문서 → 서버에서 생성

=== Harpooning Tmux 세션 관리자
#dim_text("개인 프로젝트\n2026. 04.")

#additional_title("개발 환경 생산성 도구")

==== 해결한 문제
- 새 프로젝트를 tmux 세션으로 등록하는 시간: 25.3초 → 0.8초 (31배 향상)
- fzf로 .git 폴더 있는 디렉토리 검색 → 선택 시 새 세션으로 추가
- 즐겨찾기 목록 순서대로 숫자 단축키(0\~9)로 즉시 이동

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬 + 구글 시트 기반 진도 관리 시스템 자체 제작으로 차별화된 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

== 교육
=== 고려대학교
#dim_text("경제학과 | 졸업\n2013. 02. ~ 2020. 02.")

=== 넥스트러너스 오즈코딩스쿨
#dim_text("프론트엔드 부트캠프\n2025. 05. ~ 2025. 11.")
- React, Node.js, PostgreSQL 학습 및 심화반 수강
- 최우수 수료

#pagebreak()
== 포트폴리오

#link("https://arbor-the-tree-production.up.railway.app/")[Arbor The Tree 배포 페이지 \ ]
#link("https://github.com/ThePott/harpooning-tmux")[Harpooning Tmux GitHub]
