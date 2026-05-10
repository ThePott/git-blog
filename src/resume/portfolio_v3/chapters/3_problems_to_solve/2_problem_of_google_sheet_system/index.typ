#import "../../../components/title-section/index.typ": title-section
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./diagram/index.typ": diagram

#let problem_of_google_sheet_system = [
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
            #diagram
        ],
    )
]
