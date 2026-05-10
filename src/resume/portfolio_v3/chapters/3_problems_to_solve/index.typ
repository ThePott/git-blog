#import "../../components/rem/index.typ": rem
#import "../../components/title-section/index.typ": title-section
#import "../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_problem_of_math_school/index.typ": diagram_1_problem_of_math_school
#import "./diagram_2_problem_of_google_sheet_system/index.typ": diagram_2_problem_of_google_sheet_system
#import "./diagram_3_problem_of_client/index.typ": diagram_3_problem_of_client

#let problems_to_solve = [
    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로"),
        (level: 1, size: "lg", title: "해결하려고 한 문제"),
    )
    #two-column-section(
        [
            1. 입시 학원의 문제
                - 강사 기억에 의존한 진도 추적
                - 비정량적 진도
                - 오답 복습 관리 불가

            2. 구글 시트 + 파이썬 시스템의 문제
                - 이를 해결하려 파이썬과 구글 시트로 진도 관리 시스템 제작
                - CLI로 제작되어 사용자 친화성 부족
                - 병렬적 자료 생성, 직렬적 동기화로 병목 현상 발생

            3. 고객의 요구사항
                - 빠른 반응 속도 요구
                - 쉬운 조작법 요구
        ],
        [],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로 해결하려고 한 문제"),
        (level: 2, size: "lg", title: "1. 입시 학원의 문제"),
    )
    #two-column-section(
        [
            - 강사 기억에 의존한 진도 추적
                - 여러 학년을 한 반에서 가르치는 무학년 수업에서 두드러짐
                - 학생의 개별 성취도를 파악하기가 어려움
            - 비정량적 진도
                - 한 수업에서 할 양이 정해져있지 않음
                - 앞으로 몇 번의 수업이 더 필요한지 예상 불가
            - 오답 복습 관리 불가
                - 학생이 오답 복습을 했는지 확인할 방법이 없음
                - 복습 대신 새 문제집만 풀리고 학생은 틀리는 문제는 계속 틀림
        ],
        [
            #diagram_1_problem_of_math_school
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로 해결하려고 한 문제"),
        (level: 2, size: "lg", title: "2. 구글 시트 + 파이썬 시스템의 문제"),
    )
    #two-column-section(
        [
            - 이를 해결하려 파이썬과 구글 시트로 진도 관리 시스템 제작
            - CLI로 제작되어 사용자 친화성 부족
                - 다른 강사들이 사용하지 못함
            - 병렬적 자료 생성, 직렬적 동기화로 병목 현상 발생
                - 학생들이 개별로 오답체크, 진도표에 완료 표시 -> 강사가 동기화
                - 동기화에 한 학생당 5분, 한 수업당 50~100분 소요
        ],
        [
            #diagram_2_problem_of_google_sheet_system
        ],
    )

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
            #diagram_3_problem_of_client
        ],
    )
]


