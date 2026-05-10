#import "../../../components/title-section/index.typ": title-section
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./diagram/index.typ": diagram

#let problem_of_math_school = [
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
            #diagram
        ],
    )
]
