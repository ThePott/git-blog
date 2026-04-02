#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

#let troubleshooting-2-reducing-latency = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능 외 해결한 문제", size: "sm"),
        (level: 2, title: "2. 서버 응답 속도 개선", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획")
            - api server on Railway, db server on Neon
            - 문제: TODO 채워 넣어야
            - 문제: TODO 채워 넣어야
            - 문제: TODO 채워 넣어야
            - 문제: TODO 채워 넣어야
            - 문제: TODO 채워 넣어야

            #v(rem(1))
            #heading(level: 2, "개선안")
            - 컴포넌트 별 스토어 제작
            - 상태를 하나 추가할 때마다 2곳의 코드만 수정하면 됨
                - 1. 컴포넌트 interface에 해당 타입 추가
                - 2. 컴포넌트 props에 해당 매개변수 추가
                - props 전체가 store provider에 넘겨지기에 추가로 수정할 부분 없음
            - 자식 컴포넌트가 사용하는 상태가 변경될 때만 리렌더가 됨
        ],
        [#rect(
            width: 100%,
            height: 80%,
            radius: rem(1),
            inset: rem(1),
            stroke: (thickness: 1pt, paint: black),
            "관련 스크린샷",
        )],
    )
]
