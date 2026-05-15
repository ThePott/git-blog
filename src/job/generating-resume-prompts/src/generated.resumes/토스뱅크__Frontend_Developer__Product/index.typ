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
        // [수정] Product 포지션: 사용자 경험, 서비스 개발 강조
        #additional_title("사용자 경험을 깊이 고민하는 프론트엔드 개발자")
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

// [수정] 사용자 경험 개선, 서비스 흐름 이해 강조 (JD: "사용자가 경험하는 흐름을 깊이 이해하고 더 편리하고 효율적인 경험으로 개선")
*사용자의 경험 흐름을 이해하고 개선합니다*

입시 학원 강사 시절, 진도와 오답 관리 시스템을 만들었지만 CLI 기반이라 다른 강사들이 사용하기 어려웠습니다. 사용자(강사)의 업무 흐름을 분석한 후 웹앱으로 재설계했습니다. 칸반 보드로 진도를 시각화하고, 그리드 체크박스로 오답을 빠르게 체크할 수 있게 하여 실제 수업 흐름에 맞는 인터페이스를 구현했습니다.

모바일 사용자 경험도 고려합니다. 아르바이트생이 스마트폰으로 회원가입하고 권한을 요청하는 시나리오를 분석하여, 랜딩/회원가입/권한 요청 페이지를 반응형으로 구현했습니다. 또한 서버 응답 속도를 7초에서 315ms로 단축하여 사용자가 기다리지 않도록 개선했습니다.

사용자가 경험하는 전체 흐름을 이해하고, 더 편리한 방향으로 개선하는 개발자입니다. 토스뱅크의 금융 서비스 사용자 경험 개선에 기여하고 싶습니다.

== 기술 스택

// [수정] Product 포지션에 맞게 프론트엔드 중심 + 상태관리 강조
React, TypeScript, TanStack Query, TanStack Router, Zustand, Vite, Git, Express, PostgreSQL

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

// [수정] 사용자 경험 중심 업무 강조 (JD: "사용자가 경험하는 흐름을 깊이 이해")
- 사용자 경험 설계
    - 강사/학생/원장 각각의 업무 흐름 분석 후 맞춤 인터페이스 설계
    - Figma로 와이어프레임 및 디자인, 실제 사용 시나리오 기반 UI 구현
- 반응형 구현
    - 모바일 사용자(아르바이트생)를 위한 랜딩/회원가입/권한 요청 페이지 반응형 개발
- 성과
    - 서버 응답 속도 7초 → 315ms (22배 향상): 사용자 대기 시간 최소화
    - 그리드 인풋 반응 시간 20.38ms → 2.28ms (89% 향상): 빠른 입력 경험 제공

== 프로젝트

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 사용자 경험, 서비스 개발 관점 강조
#additional_title("사용자 중심 서비스 개발")

==== 해결한 문제
// [수정] 사용자 경험 흐름 분석 관점
- 기존 CLI 시스템: 다른 강사가 사용법 습득 불가
    - 사용자(강사)의 업무 흐름을 분석하여 웹앱으로 재설계
- 강사의 기억에 의존하던 진도 추적
    - 칸반 보드로 진도 시각화, 드래그앤드롭으로 상태 변경

==== 주요 성과

// [수정] UX 개선 관점 성과 강조
- 사용자 대기 시간 최소화
    - 서버 응답 7초 → 315ms (22배 향상): DB 인프라 최적화
    - 그리드 입력 반응 20.38ms → 2.28ms (89% 향상): 가상 스크롤로 DOM 최소화
- 모바일 사용자 경험 개선
    - 아르바이트생의 스마트폰 사용 시나리오 분석
    - 랜딩/회원가입/권한 요청 페이지 반응형 구현
- PDF 생성 UX 개선
    - 서버 사이드 생성으로 브라우저 멈춤 현상 제거

==== 기술적 해결

- TanStack Query로 서버 상태 관리, Zustand로 클라이언트 상태 관리
- TanStack Router로 타입 안전한 라우팅 구현

=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발 생산성 향상 CLI 도구")

==== 주요 성과
- 새 프로젝트 세션 등록 시간: 25.3초 → 0.8초 (31배 향상)
- Bash 스크립트로 세션 관리 자동화

== 포트폴리오
=== 링크

#link("https://arbor-the-tree.com")[Arbor The Tree - 사용자 중심 서비스 \ ]
#link("https://github.com/ThePott/harpooning")[Harpooning - CLI 자동화 도구]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

