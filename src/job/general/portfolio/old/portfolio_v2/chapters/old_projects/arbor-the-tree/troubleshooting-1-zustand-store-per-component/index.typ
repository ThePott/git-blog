#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem
#import "./local-store-diagram/index.typ": local-store-diagram

// 관련 포스트
// https://zustand.docs.pmnd.rs/reference/hooks/use-store#usestore
//
#let troubleshooting-1-zustand-store-per-component = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능 외 해결한 문제", size: "sm"),
        (level: 2, title: "1. 컴포넌트별 Zustand 스토어", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획: Context API 사용 공통 컴포넌트")
            - 공통 컴포넌트 개발 중, 상태 전달을 쉽게 하기 위해 Context API를 사용
            - boilerplate을 줄이기 위해 zustand로 해당 기능 구현 시도

            #v(rem(1))
            #heading(level: 2, "개선안: 공통 컴포넌트 별 Zustand Store")

            #heading(level: 3, "zustand store: global vs local")
            #heading(level: 4, "how to create global store")
            - `create` or ...
            1. pass values to `createStore`
            2. `useStore`
            #heading(level: 4, "how to create local store")
            1. pass values to factory function that returns `createStore`
            2. call factory function to create distinct stores
            3. `useStore` with distinct stores
        ],
        [
            #shadowed-round-box(
                title: [Component-Local Store Pattern],
                content: [#local-store-diagram],
            )
        ],
    )
]
