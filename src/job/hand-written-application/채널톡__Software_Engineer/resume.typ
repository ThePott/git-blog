#import "/src/job/general/resume/resume_v2/components/page_settings/index.typ": page_setting
#import "/src/job/general/resume/resume_v2/components/dim_text/index.typ": dim_text
#import "/src/job/general/resume/resume_v2/components/rem/index.typ": rem
#import "/src/job/general/resume/resume_v2/components/hr/index.typ": hr
#import "/src/job/general/resume/resume_v2/components/shadowed_round_box/index.typ": shadowed_round_box

#show: page_setting

#let additional_title(content) = text(size: rem(1.2), weight: "semibold", content)


#grid(
    columns: (1fr, 100pt),
    column-gutter: 20pt,
    [
        = 하흥주
        #v(rem(0.5))
        #additional_title("본질과 명료함을 추구하는 소프트웨어 엔지니어")
        #v(rem(2))
        #dim_text[nusilite\@gmail.com]
        #v(rem(1))
        문제를 정확히 정의하고, 단순한 해결책을 만듭니다
    ],
    [
        #shadowed_round_box[
            #image("/src/job/general/resume/resume_v2/assets/nusilite.jpg")
        ]
    ],
)

== 자기소개

*본질과 명료함을 추구합니다*

문제들에는 공통점이 있습니다. 각각의 문제들을 개별적으로 해결하는 건 미래의 문제를 해결하는 데에 큰 도움 안 됩니다. 모든
문제는 독자적이고 새롭습니다. 어떨지 모르는 미래의 문제를 해결하기 위해선 보다 문제의 근원, 원형(Archetype)을 생각해야
합니다.

본질적 문제 해결에는 두 가지 장점이 있습니다. 첫째, 본질적 코드를 재사용하는 패턴을 자연스럽게 사용하게 되어 문제의
가능성이 해당 코드에만 격리됩니다. 저는 모든 프로젝트를 할 때 공통 컴포넌트를 레이아웃 단계부터 설계합니다. 이로써 코드
반복을 줄이고 문제의 가능성을 한 지점에 격리합니다. 디자인을 일관되게 적용할 뿐 아니라 문제 발생 시 그 해결 또한 한 번에
합니다.

둘째, 성능을 향상합니다. 표층적인 문제만 해결할 경우, 기존의 거대한 기술 스택을 그대로 사용하기 때문에 성능이 저하되는
경우가 많습니다. 모든 걸 리액트로 해결하려는 경우처럼 말입니다. 본질을 파악하면 다시 한참 밑으로 내려가 최소한만의
자원을 사용할 수 있고 이는 성능 향상으로 이어집니다. 저는 이를 바탕으로 PDF 생성 성능을 약 60 퍼센트 개선하였습니다.

채널톡은 기초의 중요성을 그 어떤 기업보다 강조합니다. 기초를 중시하는 채널톡에서 기본과 본질에 집중하는, 채널톡의
문제들을 진단하고 해결하며 채널톡과 제가 더더욱 탄탄해지게 할 것입니다.

== 기술 스택

React, TypeScript, TanStack Query, Zustand, Vite, Express, PostgreSQL, Prisma, Git

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
- 드롭다운 잘림 문제: createPortal로 document.body에 렌더링, Floating UI로 위치 계산
- 다층 구조 가상 스크롤: book → topic → step → question 계층을 줄 단위로 평탄화 후 가상화
- 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, 한글 폰트를 Railway 배포 시 자동 설치

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
