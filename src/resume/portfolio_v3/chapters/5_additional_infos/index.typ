#let additional_info = [
    #pagebreak()
    Arbor The Tree - 이용 안내

    #heading(level: 2, "링크")
    - https://arbor-the-tree-production.up.railway.app/
    - https://github.com/ThePott/arbor-the-tree
    - #link(
            "https://arbor-the-tree-production.up.railway.app/test/login",
        )[테스트 계정 로그인 페이지]
    - #link(
            "https://arbor-the-tree-production.up.railway.app/test/pdf",
        )[pdf 생성 성능 비교 페이지]
    // #v(rem(1))
    #heading(level: 2, "테스트 계정")

    #table(
        columns: 3,
        // inset: (x: rem(1), y: rem(0.5)),
        stroke: (paint: luma(0, 25%)),
        [*계정*], [*ID*], [*Password*],
        [원장], [`test12@test.test`], [`test1234!@#$`],
        [실장], [`test13@test.test`], [`test1234!@#$`],
        [학생], [`test14@test.test`], [`test1234!@#$`],
    )
]


