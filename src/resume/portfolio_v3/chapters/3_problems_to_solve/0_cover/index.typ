#import "../../../components/title-section/index.typ": title-section
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./diagram/index.typ": diagram

#let cover = [
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
        [
            #diagram
        ],
    )
]
