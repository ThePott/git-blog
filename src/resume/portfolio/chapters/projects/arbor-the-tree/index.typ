#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../components/rem/index.typ": rem
#import "./latency-comparison-chart/index.typ": latency-comparison-chart
#import "./main-feature-1-grid-input/index.typ": main-feature-1-grid-input
#import "./main-feature-2-server-side-pdf/index.typ": main-feature-2-server-side-pdf


#let chapter-project-arbor-the-tree = [
    = Arbor The Tree - 진도 및 오답 관리 시스템
    == 기획 의도
    === 강사 재직 시절, 구글 시트와 파이썬을 이용해 사용한 진도 및 오답 관리 시스템을 웹앱으로 제작
    == 주요 기능
    === 그리드 인풋 및 다중 입력
    ==== 특수 문자 입력으로 자동 입력, 자동 삭제를 하여 이용 편의성 증진
    ==== 가상 스크롤로 그리드 인풋의 반응 속도를 4초에서 0.3초로 단축하며, 유효성 검사는 유지
    === 오답 그리드 및 다중 선택
    ==== 가상 스크롤로 그리드 체크박스의 반응 속도를 0.3초에서 0.1초로 단축
    ==== 오답 체크를 할 때마다 진도 캐시를 무효화하여 해당 문제 묶음의 완료 여부를 갱신
    == 주요 기능 외 해결한 문제
    === 서버 응답 속도 개선: 7s -> 0.3s
    === typst compiler를 활용한 pdf 생성으로, react-pdf 대비 생성시간 90% 단축
    === props drilling, re-render 문제를 컴포넌트별 Zustand 스토어로 해결

    #pagebreak()
    #main-feature-1-grid-input

    #pagebreak()
    #main-feature-2-server-side-pdf


    #pagebreak()
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능 외 해결한 문제", size: "sm"),
        (level: 2, title: "1. 컴포넌트별 Zustand 스토어", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획")
            - 복잡한 공통 컴포넌트 제작 시 props-drilling을 막기 위해 Context API를 사용
            - 상태를 하나 추가할 때마다 4곳의 코드 수정해야 함
                - 1. 컴포넌트 interface에 해당 타입 추가
                - 2. 컴포넌트 props에 해당 매개변수 추가
                - 3. context provider의 value에 해당 상태 추가 주입
                - 4. context type 수정
            - 어느 상태가 변해도 context 구독 중인 모든 컴포넌트가 리렌더 됨

            #v(rem(1))
            #heading(level: 2, "개선안")
            - 컴포넌트 별 스토어 제작
            - 상태를 하나 추가할 때마다 2곳의 코드만 수정하면 됨
                - 1. 컴포넌트 interface에 해당 타입 추가
                - 2. 컴포넌트 props에 해당 매개변수 추가
                - props 전체가 store provider에 넘겨지기에 추가로 수정할 부분 없음
            - 자식 컴포넌트가 사용하는 상태가 변경될 때만 리렌더가 됨

            #heading(level: 3, "해결한 문제")
            - 문제: 같은 버튼 컴포넌트여도 스토어를 공유해선 안 됨
            - 해결: 스토어 생성을 컴포넌트 내에서 하고 이를 useState에 저장
                1. TODO: 구체적 단계 적어야
                1. TODO: 구체적 단계 적어야
                1. TODO: 구체적 단계 적어야
                1. TODO: 구체적 단계 적어야
                1. TODO: 구체적 단계 적어야
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


    #pagebreak()
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

    #pagebreak()
    #title-section(
        (level: 1, title: "Arbor The Tree - 이용 방법", size: "lg"),
    ) <how-to-use-arbor-the-tree>
    #heading(level: 2, "링크")
    - https://arbor-the-tree-production.up.railway.app/
    - https://github.com/ThePott/arbor-the-tree
    - #link("https://arbor-the-tree-production.up.railway.app/test/login")[테스트 계정 로그인 페이지]
    - #link("https://arbor-the-tree-production.up.railway.app/test/pdf")[pdf 생성 성능 비교 페이지]
    #v(rem(1))
    #heading(level: 2, "테스트 계정")
    #table(
        columns: 3,
        inset: (x: rem(1), y: rem(0.5)),
        stroke: (paint: luma(0, 25%)),
        [*계정*], [*ID*], [*Password*],
        [원장], [`test12@test.test`], [`test1234!@#$`],
        [실장], [`test13@test.test`], [`test1234!@#$`],
        [학생], [`test14@test.test`], [`test1234!@#$`],
    )]
