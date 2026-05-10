#import "../../../components/title-section/index.typ": title-section
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./diagram/index.typ": diagram

#let problem_of_client = [
    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로 해결하려고 한 문제"),
        (level: 2, size: "lg", title: "3. 고객의 요구사항"),
    )
    #two-column-section(
        [
            - 빠른 반응 속도 요구
            - 쉬운 조작법 요구
                - 아르바이트생의 잦은 교체에도 사용법 인수인계가 원활히 되어야
                    - 고객(원장)은 강의에만 집중 희망
                    - 스스템 운용은 아르바이트생에게 위임 계획
        ],
        [
            #diagram
        ],
    )
]
