#import "../../../components/rem/index.typ": rem
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/override-enum-numbering/index.typ": override-enum-numbering
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./a_kanban_progress/index.typ": a_kanban_progress
#import "./b_grid_input/index.typ": b_grid_input

#let easy_interface = [
    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로 해결한 과제"),
        (level: 1, size: "lg", title: "1. 쉬운 사용법"),
    )
    #two-column-section(
        [
            #override-enum-numbering(numbering: "a.")[
                1. 칸반 진도표
                    - 기존 진도표의 문제와 그 해결
                    - Troubleshooting: 드롭다운이 스크롤바에 잘림

                2. 그리드 인풋
                    - 기존 문제집 등록 과정의 문제
                    - 후보 기술 스택
                    - 문제의 본질 파악
                    - Troubleshooting: 유효성 검사 성능 개선
                    - Troubleshooting: 키보드 내비게이션
            ]
        ],
        [], // NOTE: MUST BE BLANK
    )

    #a_kanban_progress
    #b_grid_input
]
