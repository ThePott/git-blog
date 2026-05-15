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
        // [수정] 자동화 포지션에 맞게 타이틀 변경
        #additional_title("반복 업무를 자동화하는 Node.js 개발자")
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

// [수정] 자동화 인프라, CLI 도구 개발 경험 강조 (JD: "공용 라이브러리, CLI 도구 등 개발자 생산성 도구")
*반복 업무를 분석하고 자동화합니다*

입시 학원 강사 시절, 진도와 오답 관리에 학생당 5분, 수업당 최대 100분이 소요되었습니다. 파이썬과 구글 시트로 자동화 시스템을 만들어 이 시간을 크게 단축했고, 이후 Node.js 기반 웹앱으로 발전시켜 다른 사용자도 쉽게 사용할 수 있게 했습니다.

개발 환경에서도 반복 업무를 자동화합니다. Tmux 세션 관리에 시간이 많이 소요되어 CLI 자동화 도구를 직접 개발했습니다. Bash 스크립트로 세션 생성/삭제/이동을 자동화하여 프로젝트 세션 등록 시간을 25초에서 0.8초로 단축했습니다.

반복 업무의 본질을 파악하고 자동화하는 개발자입니다. 토스의 모바일 자동화 플랫폼과 개발자 생산성 도구 개발에 기여하고 싶습니다.

== 기술 스택

// [수정] Node.js 자동화 포지션에 맞게 백엔드 + 자동화 관련 기술 우선 배치
Node.js, TypeScript, Express, Bash, PostgreSQL, Prisma, REST API, Git

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

// [수정] 자동화 인프라, 배포 자동화 관점 강조 (JD: "자동화 인프라 설계/개발")
- 반복 업무 자동화 시스템 구축
    - 학생당 5분, 수업당 50~100분 소요되던 수기 동기화 작업을 웹앱으로 자동화
    - 기존 파이썬 CLI 시스템 분석 후 Node.js 기반으로 재설계
- 배포 자동화 스크립트 개발
    - npm install로 설치되지 않는 Typst 컴파일러, 폰트 파일을 Railway 배포 시 자동 설치
    - curl을 이용한 바이너리 다운로드 및 경로 설정 자동화
- 성과
    - 서버 응답 속도 7초 → 315ms (22배 향상): 인프라 구성 최적화
    - 서버 사이드 PDF 생성으로 80쪽 기준 30.7% 시간 단축

== 프로젝트

// [수정] Harpooning을 먼저 배치 - CLI 자동화 도구가 이 포지션 핵심 (JD: "CLI 도구 등 개발자 생산성 도구")
=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발자 생산성 CLI 자동화 도구")

==== 해결한 문제
- 프로젝트 간 이동 시 세션 검색에 평균 25초 소요
- 기존 도구들의 한계: 세션 순서 변경 불가, 즐겨찾기 관리 부재

==== 기술적 해결
- Bash 스크립트로 tmux 세션 관리 전체 워크플로우 자동화
- fzf를 활용한 프로젝트 디렉토리 검색 및 세션 생성 자동화
- grep/sed를 이용한 텍스트 파싱으로 세션 목록과 실제 상태 양방향 동기화
- 상태 변경 감지 및 자동 정리 (삭제된 세션 목록에서 제거)

==== 주요 성과
- 새 프로젝트 세션 등록 시간: 25.3초 → 0.8초 (31배 향상)
- 숫자 단축키(0~9)로 즉시 세션 이동
- 목록 삭제만으로 실제 세션 종료 자동화

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 자동화 인프라 관점 강조
#additional_title("Node.js 백엔드 + 배포 자동화")

==== 해결한 문제
- 기존 파이썬 시스템의 느린 속도
    - 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
- 강사의 기억에 의존하던 진도 추적 → 자동화된 시스템으로 전환

==== 주요 성과

// [수정] 인프라 최적화 경험 강조
- 서버 응답 속도 7초 → 315ms (22배 향상)
    - Neon DB의 cold start, region 문제 분석 후 Railway PostgreSQL로 교체
    - API와 DB를 동일 internal network에 배포하여 round-trip latency 최소화
- 서버 사이드 PDF 생성 자동화
    - Typst 컴파일러 도입으로 80쪽 기준 30.7% 시간 단축

==== 기술적 해결

// [수정] 배포 자동화 스크립트 상세 설명
- 커스텀 배포 스크립트 개발
    - curl로 Typst 컴파일러 바이너리 자동 다운로드
    - 한글 폰트 파일을 typst root 내부로 자동 이동
    - Railway 배포 시 npm install 이후 자동 실행
- RESTful API: Express.js + TypeScript로 #link("https://github.com/ThePott/api-of-arbor-the-tree", "API 서버 구축")
== 포트폴리오
=== 링크

#link("https://github.com/ThePott/harpooning")[Harpooning - CLI 자동화 도구 \ ]
#link("https://github.com/ThePott/api-of-arbor-the-tree")[API 서버 (Express.js + TypeScript) \ ]
#link("https://arbor-the-tree.com")[Arbor The Tree - 업무 자동화 웹앱]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

