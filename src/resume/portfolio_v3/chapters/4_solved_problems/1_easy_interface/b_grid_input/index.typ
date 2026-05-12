#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_original_book_write_problem/index.typ": diagram_1_original_book_write_problem
#import "./diagram_2_library_candidats/index.typ": diagram_2_library_candidats
#import "./diagram_3_essence_of_problem/index.typ": diagram_3_essence_of_problem
#import "./diagram_4_trobleshoot_validation/index.typ": diagram_4_trobleshoot_validation
#import "./diagram_5_keyboard_navigation/index.typ": diagram_5_keyboard_navigation

#let b_grid_input = [
    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "b. 그리드 인풋"),
        (level: 3, size: "lg", title: "기존 문제집 등록 과정과 그 문제"),
    )
    #two-column-section(
        [
            - 기존 문제집 등록 흐름
                - 구글 시트에 문제의 id, 쪽, 문제 번호 등의 정보를 기록
                - 반복적으로 입력해야 하는 부분에서는 자동 채우기 혹은 formula 사용
            - 개선해야 했던 것
                - 작성 중에는 놓친 부분이 있는지 파악하기 어려움
                    - formula로 다 채우기 이전에는 변경 지점이 `/`로만 보임
                - 유효성 검사 부재
                    - 아르바이트생에게 맡기기에 걱정됨
        ],
        [
            #diagram_1_original_book_write_problem
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "b. 그리드 인풋"),
        (level: 3, size: "lg", title: "후보 기술 스택"),
    )
    #two-column-section(
        [
            - 기존의 작업 환경인 구글 시트와 유사한 UI 필요
            - AG Grid (부분 유료, 1년 999 달러)
                - 다중 선택, formula는 유료 기능
            - Jspreadsheet CE (무료)
                - 바닐라 JavaScript 라이브러리
                - 선언적으로 컴포넌트 생성 삭제가 불가능
            - TanStack Table (무료)
                - Headless UI Library
                - 모든 셀, 행, 열의 데이터에 언제든 접근 가능
        ],
        [
            #diagram_2_library_candidats
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "b. 그리드 인풋"),
        (level: 3, size: "lg", title: "문제의 본질"),
    )
    #two-column-section(
        [
            - 필요한 기능들은 스프레드 시트에 종속되지 않는다
                - 1씩 증가 자동 채우기: 마우스 드래그를 할 필요가 없다
                - 빈 곳 채우기: formula가 아니어도 채워지면 된다
                - 변환값 미리 보기: spreadsheet에 원래 없는 기능이다
                - 유효성 검사: spreadsheet에 원래 없는 기능이다
            - 결론: TanStack Table로 직접 구현
                - 테이블 형식이 필요한 것이지 스프레드 시트가 필요한 것이 아니다
        ],
        [
            #diagram_3_essence_of_problem
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "b. 그리드 인풋"),
        (level: 3, size: "lg", title: "Troubleshooting: 유효성 검사 성능 개선"),
    )
    #two-column-section(
        [
            - 문제 발생: 느린 유효성 검사
                - 유효성 검사를 하는 셀을 최소화하려다보니 예외 규칙과 더불어 버그가 많아짐
                - 검사 안정성 높이기 위해 모든 셀 검사
                - 2000행 x 7열의 돔 노드가 업데이트
            - 해결: 가상 스크롤
                - TanStack Virtual로 돔 노드 최소화
                - 업데이트 시간을 20.28ms에서 2.28ms로 89% 단축 (`performance.time`으로 측정)
        ],
        [
            #diagram_4_trobleshoot_validation
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "b. 그리드 인풋"),
        (level: 3, size: "lg", title: "Troubleshooting: 키보드 내비게이션"),
    )
    #two-column-section(
        [
            - 문제 발생: 구글 시트보다 조악한 키보드 내비게이션
                - 모든 셀은 `<input />`일 뿐이라 키보드 이동은 tab만 지원
                - 방향키로 이동 불가
                - 엔터로 아래 셀 이동 불가
            - 해결: custom data attribute
                1. `data-coordinate={...}` 부여
                2. 방향키, 엔터 입력 시 다음 coordinate 계산
                3. querySelector로 목적지 돔 노드 선택
                4. focus
        ],
        [
            #diagram_5_keyboard_navigation
        ],
    )
]
