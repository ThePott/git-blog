#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/title-section/index.typ": title-section

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
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
        (level: 2, title: "1. 그리드 인풋 및 다중 입력", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "그리드 인풋")
            - 구글 스프레드 시트와 유사한 UI
            - custom data attribute `data-coordinate`을 이용한 키보드 내비게이션

            #v(1em)
            #heading(level: 2, "다중 입력")
            - 셀에 `/` 입력 시, 자동으로 알맞는 값을 오버레이, 그 밑의 빈 셀 모두에 같은 값 오버레이
            - 문제 번호에 `~` 입력 시, 해당 번호들을 자동 완성 (예: `확인 1~10`)
            - 문제 번호 끝에 `-` 입력 시, 해당 셀부터 끝까지의 문제 번호 삭제 (예: `122-`)

            #v(1em)
            #heading(level: 2, "유효성 검사")
            - 문제 번호 없이 다른 열의 값 기입 시 오류 알림
            - 자동 완성할 것이 더 이상 없을 때 `/`를 사용 시 오류 알림
            - 문제 번호가 없는 행에서는 자동 완성 비활성화
            #heading(level: 3, "해결한 문제")
            - 빠른 반응을 위해 유효성 검사 셀 수를 최소화하려 하였으나, 해당 로직이 너무 복잡해지고 버그가 많아짐
            - 모든 입력마다 전체 셀 유효성 검사를 하되, 가상 스크롤(TanStack Virtual)을 이용해 돔 노드를 최소화하여
                (TODO: 반응 속도 재기)로 반응되게 함
        ],
        [#rect(
            width: 100%,
            height: 80%,
            radius: 1em,
            inset: 1em,
            stroke: (thickness: 1pt, paint: black),
            "this is content",
        )],
    )

    #pagebreak()
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
        (level: 2, title: "2. 서버 사이드 pdf 생성", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획")
            - `react-pdf/renderer`를 이용한 클라이언트 사이드 pdf 생성
            - 문제: 대량의 pdf 생성 시, (TODO: 정확한 표현 적어야) 사용자 흐름 중단됨
            - 제안: 성능 향상을 위해선 웹 워커를 사용해야 함
            - 의문: 브라우저에 종속될 필요가 없는 기능인데 웹 워커가 최선인가?

            #v(1em)
            #heading(level: 2, "개선안")
            - request -> create typst file -> compile to pdf -> respond
            #heading(level: 3, "해결한 문제")
            - 문제 1: typst는 npm install로 설치 되지 않음
            - 문제 2: typst, font 파일은 npm build로 빌드되지 않음
            - 해결: `railway.json`에 buildCommand bash script를 작성
                1. typst compiler 설치
                2. `npm run build`
                3. build에서 제외되는 파일들 dist 폴더로 이동
                    - typst template files
                    - font

            #v(1em)
            #heading(level: 2, "성능 비교")
            - pdf 100장 생성 시 소요 시간 비교
            - react-pdf/renderer: (TODO: 시간 재야)
            - react-pdf/renderer with WebWalker: (TODO: 시간 재야)
            - typst: (TODO: 시간 재야)

        ],
        [#rect(
            width: 100%,
            height: 80%,
            radius: 1em,
            inset: 1em,
            stroke: (thickness: 1pt, paint: black),
            "성능 비교 그래프? 혹은 측정 스크린샷 넣자",
        )],
    )


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

            #v(1em)
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
            radius: 1em,
            inset: 1em,
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

            #v(1em)
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
            radius: 1em,
            inset: 1em,
            stroke: (thickness: 1pt, paint: black),
            "관련 스크린샷",
        )],
    )
]
