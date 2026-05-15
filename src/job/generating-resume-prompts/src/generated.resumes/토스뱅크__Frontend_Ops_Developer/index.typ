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
        // [수정] Ops 포지션: 운영 시스템, 업무 자동화 강조
        #additional_title("운영 효율성을 높이는 프론트엔드 개발자")
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

// [수정] 운영 업무 이해, 자동화 시스템 구축 강조 (JD: "비효율적인 수작업 및 운영성 업무를 자동화 시스템으로 효율성 극대화")
*반복적인 운영 업무를 시스템으로 자동화합니다*

입시 학원 강사 시절, 진도와 오답 관리라는 반복적인 운영 업무에 학생당 5분, 수업당 최대 100분이 소요되었습니다. 업무 프로세스를 분석한 후 파이썬으로 자동화 시스템을 구축했고, 이후 다른 강사도 사용할 수 있도록 웹앱으로 재설계했습니다.

Arbor The Tree는 단순한 CRUD를 넘어 운영 효율성을 고민한 시스템입니다. 칸반 보드로 진도를 시각화하고, 그리드 체크박스로 오답을 빠르게 체크할 수 있게 하며, 오답만 추출한 학습지를 자동 생성하는 기능을 구현했습니다. 서버 응답 속도를 7초에서 315ms로 단축하여 운영자가 기다리지 않도록 개선했습니다.

업무 프로세스를 이해하고 효율적인 시스템을 구축하는 개발자입니다. 토스뱅크의 운영 시스템 개발에 기여하고 싶습니다.

== 기술 스택

// [수정] Ops 포지션에 맞게 프론트엔드 + 백엔드 연동 기술 강조
React, TypeScript, TanStack Query, Zustand, Vite, Git, Express, PostgreSQL, Prisma

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

// [수정] 운영 업무 프로세스 이해, 자동화 관점 강조 (JD: "업무 프로세스를 이해하고 효율적으로 수행할 수 있는 시스템 구축")
- 업무 프로세스 분석 및 자동화
    - 강사의 반복적인 운영 업무(진도 기록, 오답 관리, 학습지 생성) 분석
    - 수기 동기화 작업을 시스템으로 자동화
- 운영 시스템 설계 및 개발
    - 비즈니스 요구사항 분석 후 화면 설계 (Figma)
    - 운영자가 쉽게 사용할 수 있는 UI 구현
- 성과
    - 서버 응답 속도 7초 → 315ms (22배 향상): 운영자 대기 시간 최소화
    - 그리드 인풋 반응 시간 20.38ms → 2.28ms (89% 향상): 빠른 데이터 입력

== 프로젝트

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 운영 시스템, 자동화 관점 강조 (JD: "CRUD를 넘어 운영 효율성과 자동화를 고민하고 개선")
#additional_title("운영 업무 자동화 시스템")

==== 해결한 문제
- 반복적인 수작업 운영 업무
    - 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
    - 자동화 시스템으로 전환하여 효율성 극대화
- 단순 CRUD를 넘어 운영 효율성 개선
    - 오답만 추출하여 학습지 PDF 자동 생성
    - 칸반 보드로 진도 시각화, 상태 변경 자동 반영

==== 주요 성과

// [수정] 운영 효율성 개선 관점
- 운영자 대기 시간 최소화
    - 서버 응답 7초 → 315ms (22배 향상): DB 인프라 분석 후 최적화
    - 그리드 입력 반응 20.38ms → 2.28ms (89% 향상): 가상 스크롤 적용
- PDF 자동 생성 기능
    - 서버 사이드 Typst 컴파일로 80쪽 기준 30.7% 시간 단축
    - 브라우저 부담 없이 대량 문서 생성 가능

==== 기술적 해결

- TanStack Query로 서버 상태 캐싱 및 자동 갱신
- Zustand로 컴포넌트별 로컬 스토어 패턴 적용

=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("개발 워크플로우 자동화")

==== 주요 성과
- 반복 작업 자동화: 세션 등록 25.3초 → 0.8초 (31배 향상)
- Bash 스크립트로 세션 생성/삭제/이동 자동화

== 포트폴리오
=== 링크

#link("https://arbor-the-tree.com")[Arbor The Tree - 운영 자동화 시스템 \ ]
#link("https://github.com/ThePott/harpooning")[Harpooning - 워크플로우 자동화 도구]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

