#import "../../../components/title-section/index.typ": title-section
#import "../../../components/rem/index.typ": rem
#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box

#let heading1 = (level: 1, size: "sm", title: "1. 비즈니스적 문제 정의")

#let define_client_problem = [
    #title-section(
        heading1,
        (level: 2, size: "lg", title: "입시 학원의 문제"),
    )
    #two-column-section(
        [
            - 진도는 강사의 기억에 의존함
                - 한 반에 여러 학년을 동시에 가르치는 무학년 수업에서 두드러짐
            #v(rem(1))
            - 오답 복습은 학생에게 위임한 뒤 관리하지 않음
                - 한 문제집을 여러 번 푸는 게 좋다는 걸 앎
                - 하지만 오답을 추적 관리할 방법이 없음
                - 새 문제집만 계속 풀림
                    - 학생은 맞히는 문제만 맞히고 틀리는 문제는 계속 틀림
        ],
        [
            #shadowed-round-box(
                content: " - 말풍선: 저번 진도 어디까지 나갔어 -> 여기요 -> 여기 숙제 아니었어? -> 아니었는데요 -> ?? 그래? 일단 이거 풀어",
            )

        ],
    )

    #pagebreak()
    #title-section(heading1, (level: 2, size: "lg", title: "구글 시트 + 파이썬 시스템의 문제"))
    #two-column-section(
        [
            - 느림: 구글 시트를 DB로 사용
            - 다른 강사가 사용법 습득 불가: CLI로만 작동
            - 병목 발생: 병렬적 자료 생성, 직렬적 동기화
                - 학생별 자료 생성, 강사가 시스템과 동기화
                - 학생당 5분, 수업당 50~100분 소요
        ],
        [
            #shadowed-round-box(content: [
                - 전 수업 끝나기 전
                    - 나간 진도 체크하며 숙제 부여
                    - 학생들이 오답 체크하고 제출
                - 다음 수업 준비
                    - 제출받은 오답 체크를 DB에 입력
                    - 오답 과제 생성
                    - 전 진도표에서 체크된 숙제 바탕으로 새 진도표 생성
            ])
        ],
    )


    #pagebreak()
    #title-section(heading1, (level: 2, size: "lg", title: "고객의 문제"))
    #two-column-section(
        [
            - 빠른 반응속도 요구
            - 쉬운 조작법 요구
                - 아르바이트생의 잦은 교체에도 사용법 인수인계가 원활히 되어야
                    - 고객(원장)은 강의에만 집중하고 싶어함
                    - 고객은 시스템의 직접적 운용은 아르바이트생에게 위임 계획
        ],
        [#shadowed-round-box(content: [
            - 원장 - 학생 수업
            - 아르바이트생 + 시스템 - 학생 관리
        ])],
    )
]
