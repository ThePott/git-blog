#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

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
            - 그러나 전달인자로 상태를 하나 더 받을 때마다 4곳의 코드 수정해야 함
                1. 최상위 컴포넌트 interface
                2. 최상위 컴포넌트 props
                3. context provider의 value
                4. context type
            - 어느 상태가 변해도 context 구독 중인 모든 컴포넌트가 리렌더 됨

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
            3. useStore does not get mixed up

            #heading(level: 3, "reducing boilerplate")
            - 스토어 상태를 받는 `LocalStoreContext` 콘텍스트를 만들어 컴포넌트 구획 내에서만 store를 공유할 수 있게 함
            - #link(
                    "https://zustand.docs.pmnd.rs/reference/hooks/use-store#using-scoped-(non-global)-vanilla-store-in-react",
                )[글로벌 스토어가 안 되게 하기 위해 `create`이 아닌 `useStore`를 사용]
            - 콘텍스트에 저장된 store와 전달인자로 받은 selectorFn을 `useStore`에 넣어 구획된 스토어 후크를 리턴함
            #heading(level: 3, "LocalStoreProvider")
            - 매개변수로 스토어에 저장할 값들과 자식을 받음
            - 매개변수로 받은 값들을 `createStore`에 넣어 스토어 생성 함수를 만들고 이 함수를 `useState`에 넣어서 스토어
                생성 함수는 컴포넌트가 마운트 되는 시점에만 호출되도록 함
            - `useState` 안의 `createStore`가 만든 스토어를, `LocalStoreContext.Provider`의 `value`에 넣음
            #heading(level: 2, "참고")
            - create = value -> createStore -> useStore globally


            #v(rem(1))
            #heading(level: 2, "성과")
            - 상태를 하나 추가할 때마다 2곳의 코드만 수정하면 됨
                1. 최상위 컴포넌트 interface
                2. 최상위 컴포넌트 props
            - props 전체가 store provider에 넘겨지기에 추가로 수정할 부분 없음
            - 자식 컴포넌트가 사용하는 상태가 변경될 때만 리렌더가 됨
            - context api를 세팅할 때보다 더 적은 코드로 상태 공유 세팅 가능(TODO: 구체적으로 코드를 얼마나 줄였는지
                재서 비교하자)
        ],
        [#rect(
            width: 100%,
            height: 80%,
            radius: rem(1),
            inset: rem(1),
            stroke: (thickness: 1pt, paint: black),
            "관련 내용 도식화",
        )],
    )
]
