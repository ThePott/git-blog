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
        // [수정] 타이틀 변경: 토스페이먼츠 JD에 맞춰 복잡한 비즈니스 문제 해결 강조
        #additional_title("복잡한 비즈니스를 단순한 코드로 풀어내는 프론트엔드 개발자")
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

// [수정] 자기소개 전체 수정: 레거시 개선, 복잡한 문제 단순화 경험 강조
*레거시를 청산하고, 복잡한 문제를 단순하게 풀어냅니다*

입시 학원 강사로 일하며 파이썬 CLI와 구글 시트로 진도 및 오답 관리 시스템을 만들었습니다. 효과적이었지만 CLI 기반이라 다른 강사들은 사용할 수 없었습니다. 이 레거시 시스템을 React 웹앱으로 완전히 재설계했습니다.

재설계 과정에서 복잡한 비즈니스 문제들을 마주했습니다. 100개 이상의 셀을 동시에 관리하는 그리드 입력, 학생별 진도와 오답 상태의 복잡한 상태 관리, 느린 서버 응답 문제. 각각을 TanStack Virtual 가상 스크롤, Zustand 로컬 스토어, 인프라 재구성으로 단순하게 해결했습니다. 서버 응답 22배, 그리드 입력 89% 향상이라는 결과를 얻었습니다.

복잡한 요구사항을 유연하게 받아들이고, 단순한 코드로 풀어내는 개발자가 되고자 합니다.

== 기술 스택

// [수정] 기술 스택 순서 변경: React, TypeScript, TanStack Query, Zustand, Vite, Git 순
React, TypeScript, TanStack Query, Zustand, Vite, Git

== 경력
=== 아르보 수학학원
#dim_text("중고등부 수학 | 강사 | 프리랜서\n2020. 02. ~ 2024. 07. (4년 6개월)")

- 파이썬과 구글 시트를 사용한 자체 제작 진도 및 오답 관리 시스템으로 체계적인 학생 관리
- 개념서 자체 제작, 100점 획득 학생 배출

=== 아르보 수학학원
#dim_text("(부서 없음) | 개발자 | 계약직\n2025. 11. ~ 2026. 04. (6개월)")

// [수정] 타이틀 변경: 레거시 청산 강조
#additional_title("레거시 CLI 시스템 → 웹앱 완전 재설계")

==== 담당 업무

// [수정] 담당 업무 재구성: 복잡한 문제를 단순하게 추상화한 경험 강조
- 레거시 청산
    - 파이썬 CLI + 구글 시트 기반 시스템의 한계점 분석
    - React 웹앱으로 완전히 재설계, 다른 강사도 사용 가능하도록 개선
- 복잡한 문제 → 단순한 해결
    - 100개 이상 셀 동시 관리 → TanStack Virtual 가상 스크롤로 DOM 최소화
    - 복잡한 학생별 상태 관리 → Zustand 로컬 스토어로 단순화
    - 7초 서버 응답 → 인프라 재구성으로 0.3초 달성
- 성과
    - 서버 응답 속도 22배 향상 (7초 → 0.3초)
    - 그리드 입력 반응 시간 89% 단축 (20.38ms → 2.28ms)
    - 서버 사이드 PDF 생성으로 브라우저 부담 제거

== 프로젝트

=== Arbor The Tree 오답관리 시스템
#dim_text("아르보 수학학원\n2025. 11. ~ 2026. 04.")

// [수정] 타이틀 변경: 복잡한 문제를 단순하게 추상화 강조
#additional_title("복잡한 비즈니스 로직을 단순한 구조로 추상화")

==== 해결한 문제
// [수정] 해결한 문제 재구성: 복잡성 → 단순화 프레임 강조
- 복잡한 상태 관리 문제
    - 학생별 진도, 오답 상태, 과제 현황이 얽힌 복잡한 데이터 흐름
    - Zustand 로컬 스토어로 컴포넌트별 관심사 분리, 단순한 구조로 추상화
- 레거시 시스템의 확장성 한계
    - 파이썬 CLI는 개발자만 사용 가능, 구글 시트는 동기화에 수작업 필요
    - 웹앱으로 재설계하여 누구나 사용 가능한 형태로 전환
- 성능 병목
    - 문제 원인 분석 후 각각에 맞는 단순한 해결책 적용

==== 주요 성과

// [수정] 성과 섹션: 문제 분석 → 단순한 해결책 패턴 강조
- 서버 응답 속도 22배 향상 (7초 → 0.3초)
    - 문제 분석: Neon DB cold start + region latency
    - 단순한 해결: Railway PostgreSQL로 교체, 동일 internal network 배포
- 그리드 입력 반응 시간 89% 단축 (20.38ms → 2.28ms)
    - 문제 분석: 100개 이상 셀의 DOM 노드 과다
    - 단순한 해결: TanStack Virtual 가상 스크롤로 렌더링 최소화
- PDF 생성 브라우저 부담 제거
    - 문제 분석: react-pdf의 메인 스레드 점유
    - 단순한 해결: 서버 사이드 Typst 컴파일로 전환

==== 기술적 해결

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

