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
        #additional_title("본질과 명료함을 추구하는 프론트엔드 엔지니어")
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

*기획부터 개발까지의 경험으로, 구조적 문제를 찾고 해결합니다*

입시 학원에서 강사로 4년 6개월간 일하며 두 가지 문제를 발견했습니다. 강사 기억에 의존한 진도 추적, 학생에게만 맡기는
오답 복습이었습니다. 이를 해결하고자 파이썬과 구글 시트로 진도 관리 시스템을 만들었고, 이후 웹앱으로 발전시켰습니다.

개발 과정에서 문제를 마주할 때 표면적 해결이 아닌, 문제의 본질에 집중했습니다. 문제의 근원은 단순하고 그 단순한 문제
정의를 통해서만 단순한 해결책이 가능하다고 믿습니다. 덕분에 유료 라이브러리 없이 기능 구현을 하고, 인기 있는 라이브러리
대비 60여 퍼센트의 성능 향상을 이뤄냈습니다.

또한 저는 반복되는 문제를 줄이는 데에 집중합니다. 이에 공통 컴포넌트를 만들 때에도 레이아웃 컴포넌트 등 기초적인 것부터
설계하며, 합성 컴포넌트를 적극적으로 활용하여 비슷하지만 조금 다른 컴포넌트에도 유연하게 대응합니다. 마찬가지의
맥락에서, 프로젝트간 이동 시 발생하는 문제를 해결하기 위하여 Bash 스크립트로 개발 도구를 만들어 사용하고 있습니다.

저의 분야를 넘나든 경험과, 문제의 본질을 파악하는 시각은 엘리스가 처리하고자 하는 구조적 문제를 해결하는 데에 소통
적으로도, 그리고 기술적으로도 큰 도움이 될 것입니다. 반복을 줄이고 유지보수를 용이하게 한다는 저의 개발 철학은 엘리스의
기조와도 일치하기에, 저는 엘리스에서 빠르게 적응하고, 엘리스의 기술을 흡수하고, 성장할 것입니다.

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
