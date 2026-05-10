#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_problem_of_original_progress/index.typ": diagram_1_problem_of_original_progress
#import "./diagram_2_solution_for_original_progress/index.typ": diagram_2_solution_for_original_progress
#import "./diagram_3_troubleshoot_dropdown_cutoff_over_scrollbar/index.typ": (
    diagram_3_troubleshoot_dropdown_cutoff_over_scrollbar,
)


#let a_kanban_progress = [
    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "a. 칸반 진도표"),
        (level: 3, size: "lg", title: "기존 진도표의 문제"),
    )
    #two-column-section(
        [
            - 기존 진도표 사용 흐름
                1. 구글 시트에 문제 묶음을 복사 붙여넣기
                2. 묶음 이름 옆에 진행 상황을 키워드로 기록
                3. 이를 출력하여 학생 책상 위에 배치

            - 기존 진도표의 문제점
                1. 전체 진도표를 한 페이지에 넣다보니 글씨가 너무 작아짐
                2. 당일 수업과 무관한 것이 페이지의 대부분
                3. 조건부 포매팅 규칙을 지켜야만 사용 가능
        ],
        [
            #diagram_1_problem_of_original_progress
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "a. 칸반 진도표"),
        (level: 3, size: "lg", title: "기존 진도표의 문제의 해결책"),
    )
    #two-column-section(
        [
            - 열(column)별 분리 스크롤
                - 문제집별 스크롤 칸반 보기
            - 드롭다운에서 묶음 상태 설정 (숙제, 오늘, 해제)
            - 당일 수업에 필요한 부분만 요약 보기
        ],
        [
            #diagram_2_solution_for_original_progress
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 1. 쉬운 사용법"),
        (level: 1, size: "md", title: "a. 칸반 진도표"),
        (level: 3, size: "lg", title: "Troubleshooting: 드롭다운이 스크롤바에 잘림"),
    )
    #two-column-section(
        [
            - 현상 관찰
                - 열 컴포넌트의 자식으로 들어간 드롭다운이 스크롤바에 잘림
            - 해결책
                - `createPortal`을 이용해 컴포넌트를 `document.body`로 빼냄
                - `position: fixed` 하에서의 위치는 Floating UI 라이브러리로 계산
        ],
        [
            #diagram_3_troubleshoot_dropdown_cutoff_over_scrollbar
        ],
    )
]
