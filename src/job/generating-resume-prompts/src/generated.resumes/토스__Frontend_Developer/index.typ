#import "./components/page_settings/index.typ": page_setting
#import "./components/dim_text/index.typ": dim_text
#import "./components/rem/index.typ": rem
#import "./components/hr/index.typ": hr
#import "./components/shadowed_round_box/index.typ": shadowed_round_box

#show: page_setting

#let additional_title(content) = text(size: rem(1.2), weight: "semibold", content)


// === HEADER ===
#grid(
    columns: (1fr, 100pt),
    column-gutter: 20pt,
    [
        = 하흥주
        #v(rem(0.5))
        #additional_title("본질과 명료함을 추구하는 프론트엔드 개발자")
        #v(rem(2))
        #dim_text[nusilite\@gmail.com]
        #v(rem(1))
        문제를 정확히 정의하고, 단순한 해결책을 만듭니다
    ],
    [
        // Photo placeholder
        #shadowed_round_box[
            #image("assets/nusilite.jpg")
        ]
    ],
)

== 자기소개

// [수정] 토스 JD "복잡한 요구사항을 단순한 문제로 추상화"와 지원자 키메시지 연결
// [수정] 지원 동기 포함 (신입용): 토스의 기술 문화와 지원자 가치관 매칭

*복잡한 문제를 단순하게 해결합니다*

입시 학원에서 강사로 4년 6개월간 일하며 두 가지 문제를 발견했습니다. 강사 기억에 의존한 진도 추적, 학생에게만 맡기는
오답 복습이었습니다. 이를 해결하고자 파이썬과 구글 시트로 진도 관리 시스템을 만들었고, 이후 웹앱으로 발전시켰습니다.

웹앱 개발 과정에서 스프레드시트 라이브러리 선택, PDF 생성 위치, DB 응답 속도 등 여러 기술적 결정을 마주했습니다. 매번
"문제의 본질이 무엇인가"를 질문했고, 가장 단순한 해결책을 선택했습니다. 테이블 형식이 필요한 것이지 스프레드시트가
필요한 것이 아니었고, PDF는 브라우저와 무관한 문서였습니다.

토스의 "복잡한 요구사항을 단순한 문제로 추상화"하는 개발 문화에 공감합니다. 선배, 동료 개발자들과의 토론과 리뷰를 통해
실력을 키우고 시야를 넓혀, 서비스의 더 복잡한 문제들을 더 단순히 해결하고 싶습니다.

== 기술 스택

// [수정] 토스 기술 스택과 매칭되는 항목 강조
React, TypeScript, TanStack Query, Zustand, Vite, Express, PostgreSQL, Prisma, Git

== 프로젝트

=== Arbor The Tree 진도 관리 시스템
#dim_text("개인 프로젝트 (외주)\n2025. 11. ~ 2026. 04.")

#additional_title("복잡한 학원 운영을 단순한 시스템으로")

// [수정] XYZ formula 적용, bullet point 형식

==== 해결한 문제
- 강사 기억에 의존한 진도 추적 → 칸반 보드 기반 진도표로 시각화
- 학생당 5분, 수업당 50\~100분 소요되던 수동 동기화 → 오답 체크 시 자동 반영
- CLI 기반 기존 시스템 → 아르바이트생도 사용 가능한 웹앱으로 전환

==== 주요 성과

- 서버 응답 속도 22배 향상 (7초 → 315ms)
    - 원인 분석: Neon DB cold start + far region (N. Virginia)
    - 해결: Railway PostgreSQL로 교체, 동일 private network 배포로 latency 최소화
- 그리드 입력 반응 시간 89% 단축 (20.28ms → 2.28ms)
    - TanStack Virtual로 2000행 x 6열 DOM 노드 가상화
- PDF 생성 시간 단축 및 브라우저 부담 제거
    - 서버 사이드 Typst 컴파일로 react-pdf 대비 800쪽 기준 61.3% 단축
    - 문제의 본질 파악: PDF는 브라우저와 무관한 문서 → 서버에서 생성

==== 기술적 해결

- 스프레드시트 → TanStack Table: 필요한 건 테이블 형식이지 스프레드시트가 아님을 파악, 자동완성/유효성 검사 직접 구현
- 드롭다운 잘림 문제: createPortal로 document.body에 렌더링, Floating UI로 위치 계산
- 다층 구조 가상 스크롤: book → topic → step → question 계층을 줄 단위로 평탄화 후 가상화
- 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, 한글 폰트를 Railway 배포 시 자동 설치

==== 기술 스택
React, TypeScript, TanStack Query, TanStack Table, TanStack Virtual, Zustand, Zod, Vite, Express, PostgreSQL, Prisma,
Typst

=== Harpooning Tmux 세션 관리자
#dim_text("개인 프로젝트\n2026. 04.")

#additional_title("개발 환경 생산성 도구")

==== 해결한 문제
- 새 프로젝트를 tmux 세션으로 등록하는 시간: 20초 → 2초 (10배 향상)
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
#dim_text("프론트엔드 부트캠프\n2024. 08. ~ 2025. 01. (6개월)")

- React, Node.js, PostgreSQL 학습
- 심화반 개인 프로젝트 진행

== 포트폴리오

#link("https://github.com/ThePott/arbor-the-tree")[Arbor The Tree GitHub \ ]
#link("https://github.com/ThePott/harpooning-tmux")[Harpooning Tmux GitHub]
