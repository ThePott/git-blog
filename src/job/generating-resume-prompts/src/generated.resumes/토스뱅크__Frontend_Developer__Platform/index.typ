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

입시 학원 강사 시절, 진도와 오답 관리에 학생당 5분, 수업당 최대 100분이 소요되었습니다. "더 잘할 수 없을까?"를 고민한 끝에 파이썬으로 자동화 시스템을 만들었습니다. 하지만 CLI 기반이라 다른 강사들이 사용하기 어려웠고, 이를 웹앱으로 재설계하여 누구나 쉽게 사용할 수 있게 개선했습니다.

개발 환경에서도 같은 고민을 합니다. Tmux 세션 관리에 매번 시간이 소요되어 CLI 자동화 도구를 직접 개발했고, 세션 등록 시간을 25초에서 0.8초로 단축했습니다. 또한 Railway 배포 시 npm으로 설치되지 않는 의존성을 자동 설치하는 커스텀 빌드 스크립트도 작성했습니다.

반복되는 작업을 발견하면 자동화하고, 불편한 개발 환경은 직접 개선하는 개발자입니다. 토스뱅크 프론트엔드 개발자의 생산성을 높이는 플랫폼 개발에 기여하고 싶습니다.

== 기술 스택

// [수정] Platform 포지션에 맞게 빌드/자동화 관련 기술 포함
React, TypeScript, Vite, TanStack Query, Zustand, Git, Bash, Express, PostgreSQL

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

// [수정] DX, 빌드/배포 자동화 관점 강조 (JD: "빌드/배포에 걸리는 시간을 단축")
- 빌드/배포 자동화
    - npm install로 설치되지 않는 Typst 컴파일러, 폰트 파일을 Railway 배포 시 자동 설치하는 스크립트 작성
    - curl로 바이너리 다운로드 및 경로 설정 자동화
- 성능 최적화
    - 서버 응답 속도 7초 → 315ms (22배 향상): DB region 분석 후 인프라 재구성
    - 그리드 인풋 반응 시간 20.38ms → 2.28ms (89% 향상): TanStack Virtual로 DOM 노드 최소화
    - 서버 사이드 PDF 생성으로 브라우저 부담 제거 및 80쪽 기준 30.7% 시간 단축

== 프로젝트

// [수정] Harpooning을 먼저 배치 - 개발자 생산성 도구가 Platform 핵심 (JD: "개발에 유용한 라이브러리를 만들어서 배포")
=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발자 생산성 향상 CLI 도구")

==== 해결한 문제
- 프로젝트 간 이동 시 세션 검색에 평균 25초 소요
- 기존 도구들의 한계: 세션 순서 변경 불가, 즐겨찾기 관리 부재

==== 기술적 해결
- Bash 스크립트로 개발 워크플로우 자동화
- fzf를 활용한 프로젝트 디렉토리 검색 및 세션 생성
- grep/sed로 텍스트 파싱, 세션 목록과 실제 상태 양방향 동기화

==== 주요 성과
- 새 프로젝트 세션 등록 시간: 25.3초 → 0.8초 (31배 향상)
- 숫자 단축키(0~9)로 즉시 세션 이동

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 성능 최적화, 빌드 자동화 관점 강조
#additional_title("성능 최적화 + 빌드 자동화")

==== 해결한 문제
- 기존 파이썬 시스템의 느린 속도 (학생당 5분, 수업당 50~100분 소요)
- Railway 배포 시 Typst 컴파일러/폰트가 npm으로 설치되지 않는 문제

==== 주요 성과

// [수정] 디버깅/성능 최적화 경험 강조 (JD: "디버깅을 쉽게 할 수 있는 환경")
- 서버 응답 속도 7초 → 315ms (22배 향상)
    - cold start, region 문제 원인 분석 후 인프라 재구성
- 그리드 입력 반응 시간 20.38ms → 2.28ms (89% 향상)
    - TanStack Virtual로 가상 스크롤 구현, DOM 노드 최소화

==== 기술적 해결

- 커스텀 빌드 스크립트: curl로 Typst 바이너리 다운로드, 폰트 파일 자동 배치
- 서버 사이드 PDF 생성: Typst 도입으로 브라우저 부담 제거

== 포트폴리오
=== 링크

#link("https://github.com/ThePott/harpooning")[Harpooning - 개발자 생산성 CLI 도구 \ ]
#link("https://arbor-the-tree.com")[Arbor The Tree - 업무 자동화 웹앱]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

