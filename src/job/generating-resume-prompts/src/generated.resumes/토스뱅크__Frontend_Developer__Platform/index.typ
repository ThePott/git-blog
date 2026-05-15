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
        // [수정] Platform 포지션: DX, 자동화, 툴링 강조
        #additional_title("개발자 경험을 개선하는 프론트엔드 개발자")
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


// [수정] DX, 자동화, 개발 환경 개선 강조 (JD: "개발자의 생산성을 10X로 만든다")
*"이것보다 더 잘할 수는 없을까?"를 고민합니다*

입시 학원 강사 시절, 진도와 오답 관리에 학생당 5분, 수업당 최대 100분이 소요되었습니다. "더 잘할 수 없을까?"를 고민한
끝에 파이썬으로 자동화 시스템을 만들었습니다. 하지만 CLI 기반이라 다른 강사들이 사용하기 어려웠고, 이를 웹앱으로
재설계하여 누구나 쉽게 사용할 수 있게 개선했습니다.

개발 환경에서도 같은 고민을 합니다. Tmux 세션 관리에 매번 시간이 소요되어 CLI 자동화 도구를 직접 개발했고, 세션 등록
시간을 20초에서 2초로 단축했습니다. 또한 Railway 배포 시 npm으로 설치되지 않는 의존성을 자동 설치하는 커스텀 빌드
스크립트도 작성했습니다.

반복되는 작업을 발견하면 자동화하고, 불편한 개발 환경은 직접 개선합니다. 토스뱅크 프론트엔드 개발자의 생산성을 높여
플랫폼 개발에 기여하고 싶습니다.

== 기술 스택

// [수정] Platform 포지션에 맞게 빌드/자동화 관련 기술 포함
React, TypeScript, Vite, TanStack Query, Zustand, Git, Bash, Express, PostgreSQL


== 프로젝트

// [수정] Harpooning을 먼저 배치 - 개발자 생산성 도구가 Platform 핵심 (JD: "개발에 유용한 라이브러리를 만들어서 배포")
=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발자 생산성 향상 CLI 도구")

==== 해결한 문제
- 새 프로젝트 세션 등록에 약 20초 소요
- 세션 간 이동에 약 4초 소요
- 기존 도구들의 한계: 세션 순서 변경 불가, 즐겨찾기 관리 부재

==== 기술적 해결
- Bash 스크립트로 개발 워크플로우 자동화
- fzf를 활용한 프로젝트 디렉토리 검색 및 세션 생성
- grep/sed로 텍스트 파싱, 세션 목록과 실제 상태 양방향 동기화

==== 주요 성과
- 새 프로젝트 세션 등록 시간: 20초 → 2초 (10배 향상)
- 숫자 단축키(0\~9)로 즉시 세션 이동


=== Arbor The Tree 진도 관리 시스템
#dim_text("개인 프로젝트 (외주)\n2025. 11. ~ 2026. 04.")

#additional_title("성능 최적화 + 빌드 자동화")

// [수정] XYZ formula 적용, bullet point 형식

==== 해결한 문제
- 강사 기억에 의존한 진도 추적 → 칸반 보드 기반 진도표로 시각화
- 학생당 5분, 수업당 50\~100분 소요되던 수동 동기화 → 오답 체크 시 자동 반영
- CLI 기반 기존 시스템 → 아르바이트생도 사용 가능한 웹앱으로 전환

==== 기술적 해결
- 커스텀 빌드 스크립트: curl로 Typst 바이너리 다운로드, 폰트 파일 자동 배치
- 서버 사이드 PDF 생성: Typst 도입으로 브라우저 부담 제거

==== 주요 성과
- 서버 응답 속도 22배 향상 (7초 → 315ms)
    - 원인 분석: Neon DB cold start + far region (N. Virginia)
    - 해결: Railway PostgreSQL로 교체, 동일 private network 배포로 latency 최소화
- 그리드 입력 반응 시간 89% 단축 (20.28ms → 2.28ms)
    - TanStack Virtual로 2000행 x 6열 DOM 노드 가상화
- PDF 생성 시간 단축 및 브라우저 부담 제거
    - 서버 사이드 Typst 컴파일로 react-pdf 대비 800쪽 기준 61.3% 단축
    - 문제의 본질 파악: PDF는 브라우저와 무관한 문서 → 서버에서 생성

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

#pagebreak()
== 포트폴리오
=== 링크

#link("https://github.com/ThePott/harpooning-tmux")[Harpooning Tmux - TUI 개발자 생산성 도구 \ ]
#link("https://arbor-the-tree-production.up.railway.app/")[Arbor The Tree - 업무 자동화 웹앱]
