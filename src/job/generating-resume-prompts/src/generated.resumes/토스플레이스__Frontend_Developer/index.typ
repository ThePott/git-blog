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
        // [수정] 타이틀 변경: JD 핵심 요구사항 "복잡한 요구사항을 단순한 문제로 추상화" 반영
        #additional_title("복잡한 요구사항을 단순하게 추상화하는 프론트엔드 개발자")
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

// [수정] 자기소개 전면 수정: 주도적 문제 해결, 복잡한 요구사항 추상화 강조
*복잡한 문제를 단순하게 추상화합니다*

입시 학원에서 강사로 일하며 두 가지 문제를 주도적으로 발견했습니다. 첫째는 기억에 의존한 진도 추적, 둘째는 학생에게만
맡기는 오답 관리였습니다. 복잡한 수업 관리 요구사항을 파이썬과 구글 시트로 단순화한 시스템을 만들어 해결했습니다.

이후 웹앱으로 전환하며 서버 응답 속도 문제를 마주쳤습니다. DB cold start와 region 문제를 분석하여 인프라를 교체하고,
API와 DB를 동일 네트워크에 배포해 22배의 속도 향상을 이끌어냈습니다. 또한 복잡한 그리드 상태 관리를 Zustand 로컬 스토어로
추상화하여 89%의 입력 반응 시간을 단축했습니다.

주도적으로 문제를 발견하고, 복잡한 요구사항을 단순한 구조로 추상화하는 개발자입니다.

== 기술 스택

// [수정] 기술 스택 순서 변경 및 TanStack Query, Zustand 추가
React, TypeScript, TanStack Query, Zustand, Vite, Git

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

#additional_title("진도 및 오답 관리 시스템 제작")

==== 담당 업무

- 문제 정의
    - 고객(원장)이 수업에서 관리하고 있지 못하는 영역 파악
    - 지원자의 이전 시스템(파이썬 & 구글 시트)의 한계점 정리
    - 추후 다른 학원에도 도입할 수 있도록
- 기획
    - 요구사항에 맞게 기능 정리
    - Figma로 와이어프레임 및 디자인
- 성과
    - 서버 응답 속도 단축 7초 → 0.3초 (22배 향상)
    - 그리드 인풋 반응 시간 단축 20.38ms → 2.28ms (89% 향상)
    - 서버 사이드 생성으로 PDF 생성 시간 단축 및 브라우저 부담 제거
    - 모바일 사용자 경험 고려한 반응형 구현 (랜딩, 회원가입, 권한 요청 페이지)

== 프로젝트

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

#additional_title("시스템적 수업 관리")

==== 해결한 문제
- 기존 파이썬 시스템의 느린 속도
    - 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
- 강사의 기억에 의존하던 진도 추적
    - 자동화된 진도 관리로 전환
- 학생에게만 맡기던 오답 관리
    - 시스템으로 추적 가능하게 개선

==== 주요 성과

// [수정] "복잡한 문제를 단순하게 추상화" 경험 상세히 기술
- 서버 응답 속도 7초 → 0.3초로 단축 (22배 향상)
    - Neon DB의 cold start, region 문제를 주도적으로 분석 후 Railway PostgreSQL로 교체
    - API와 DB를 동일 internal network에 배포하여 round-trip latency 최소화
- 그리드 입력 반응 시간 20.38ms → 2.28ms로 단축 (89% 향상)
    - 복잡한 그리드 상태 관리를 Zustand 로컬 스토어로 단순화하여 리렌더링 최소화
    - TanStack Virtual을 이용한 가상 스크롤로 DOM 노드 최소화
- PDF 생성 시간 단축 및 브라우저 부담 제거
    - 서버 사이드 Typst 컴파일 도입으로 react-pdf 대비 80쪽 기준 30.7% 단축
    - 브라우저 메인 스레드 점유 없이 PDF 생성
- 다양한 환경 대응: 모바일 사용자 경험 고려한 반응형 구현 (랜딩, 회원가입, 권한 요청 페이지)

==== 기술적 해결

// [수정] 복잡한 요구사항 추상화 경험 추가
- 복잡한 상태 관리 추상화
    - 학생별 진도/오답 데이터를 Zustand 로컬 스토어로 분리하여 컴포넌트 간 의존성 단순화
    - TanStack Query로 서버 상태와 클라이언트 상태를 명확히 분리
- 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, font 파일을 Railway 배포 시 자동 설치
- RESTful API 설계: 프론트엔드와 분리된 #link("https://github.com/ThePott/api-of-arbor-the-tree", "API 서버 구축")
=== Harpooning Tmux 세션 관리자
#dim_text("개인/기타\n2026. 04. ~ 2026. 04.")

#additional_title("어떤 프로젝트든 바로 열고 닫고 이동하기")

==== 해결한 문제
- 프로젝트 간 빠르게 이동을 하려고 Tmux를 사용했으나, 세션이 많아짐에 따라 원하는 세션을 찾는 데에 오랜 시간 소요
- 전 넷플릭스 개발자 ThePrimeagen이 만든 #link("https://github.com/ThePrimeagen/harpoon")[harpoon]은 NeoVim에서의
    즐겨찾기로 페이지를 등록, 관리, 이동하게 해주고 #link(
        "https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer",
    )[tmux-sessionizer]는 컴퓨터 전체에서 프로젝트 폴더를 빠르게 검색하고 세션으로 추가하게 해줬으나, Tmux의 세션을
    #link("https://github.com/ThePrimeagen/harpoon")[harpoon]처럼 관리할 수 없음
- 즐겨찾기 목록에 적힌 세션 이름의 순서대로 단축키가 적용되게 하여 빠르게 세션 간 이동
- 즐겨찾기 목록과 실제 세션을 양방향 동기화

==== 기술적 해결
- vim 바깥에서 vim motion을 사용할 수 있도록 tmux-popup 안에서 vim 실행
    - 마크다운의 체크박스 \[ \]를 \[x\]로 체크하고 종료하면 해당 세션을 선택할 수 있게 함
    - #link("https://man7.org/linux/man-pages/man1/grep.1.html")[grep]으로 체크된 줄을 찾고 #link(
            "https://www.gnu.org/software/sed/manual/sed.html",
        )[sed]로 체크박스를 제외한 세션 이름을 추출, 해당 세션으로 이동

==== 주요 성과
- 새 프로젝트를 tmux 세션으로 등록하는 시간을 평균 25.3초에서 0.8초로 단축 (31배 향상)
- 세션 간 이동 시간 단축: 목록 순서대로 숫자 단축키(0~9)로 즉시 이동 가능
- 손쉬운 세션 정리: 목록 삭제만으로 실제 세션 종료 및 세션 종료시 즐겨찾기 목록에서도 삭제

== 포트폴리오
=== 링크

#link("https://arbor-the-tree.com")[아르보 수학학원 오답 및 진도 관리 시스템 \ ]
#link("https://github.com/ThePott/harpooning")[Harpooning Tmux 세션 관리자]

== 교육
=== 고려대학교
#dim_text("졸업 | 대학교(학사) | 경제학과\n2013. 02. ~ 2020. 02.")

