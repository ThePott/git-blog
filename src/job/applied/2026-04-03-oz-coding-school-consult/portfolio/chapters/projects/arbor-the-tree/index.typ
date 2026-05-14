#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../components/rem/index.typ": rem
#import "./main-feature-1-grid-input/index.typ": main-feature-1-grid-input
#import "./main-feature-2-server-side-pdf/index.typ": main-feature-2-server-side-pdf
#import "./troubleshooting-1-zustand-store-per-component/index.typ": troubleshooting-1-zustand-store-per-component
#import "./troubleshooting-2-reducing-latency/index.typ": troubleshooting-2-reducing-latency
#import "./introduction/index.typ": introduction
#import "./ui-screenshots/index.typ": ui-screenshots

#let chapter-project-arbor-the-tree = [
    #introduction

    #pagebreak()
    #ui-screenshots

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
        (level: 1, title: "Arbor The Tree - 이용 안내", size: "lg"),
    ) <how-to-use-arbor-the-tree>
    #heading(level: 2, "링크")
    - https://arbor-the-tree-production.up.railway.app/
    - https://github.com/ThePott/arbor-the-tree
    - #link(
            "https://arbor-the-tree-production.up.railway.app/test/login",
        )[테스트 계정 로그인 페이지]
    - #link(
            "https://arbor-the-tree-production.up.railway.app/test/pdf",
        )[pdf 생성 성능 비교 페이지]
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
