#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../components/rem/index.typ": rem
#import "./latency-comparison-chart/index.typ": latency-comparison-chart
#import "./main-feature-1-grid-input/index.typ": main-feature-1-grid-input
#import "./main-feature-2-server-side-pdf/index.typ": main-feature-2-server-side-pdf
#import "./troubleshooting-1-zustand-store-per-component/index.typ": troubleshooting-1-zustand-store-per-component
#import "./troubleshooting-2-reducing-latency/index.typ": troubleshooting-2-reducing-latency

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
    #troubleshooting-1-zustand-store-per-component


    #pagebreak()
    #troubleshooting-2-reducing-latency

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
