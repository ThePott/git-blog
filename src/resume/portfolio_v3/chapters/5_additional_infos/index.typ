#import "../../components/title-section/index.typ": title-section
#import "../../components/rem/index.typ": rem

#let additional_info = [
    #pagebreak()
    #title-section((level: 1, size: "md", title: "Arbor The Tree"), (level: 2, size: "lg", title: "이용 안내"))

    - 링크
        - https://arbor-the-tree-production.up.railway.app/
        - https://github.com/ThePott/arbor-the-tree
        - #link(
                "https://arbor-the-tree-production.up.railway.app/test/login",
            )[테스트 계정 로그인 페이지]
        - #link(
                "https://arbor-the-tree-production.up.railway.app/test/pdf",
            )[pdf 생성 성능 비교 페이지]

    - 테스트 계정
    #table(
        columns: 3,
        stroke: none,
        inset: (x: rem(2)),
        [*계정*], [*ID*], [*Password*],
        [원장], [`test12@test.test`], [`test1234!@#$`],
        [실장], [`test13@test.test`], [`test1234!@#$`],
        [학생], [`test14@test.test`], [`test1234!@#$`],
    )
]


