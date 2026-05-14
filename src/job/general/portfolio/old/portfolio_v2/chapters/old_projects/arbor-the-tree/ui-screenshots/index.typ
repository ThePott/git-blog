#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

#let ui-screenshots = [
    #heading(level: 1, "Arbor The Tree - UI")
    #v(rem(1))
    #align(center)[
        #box(width: 80%)[
            #two-column-section(
                [
                    #shadowed-round-box(
                        title: link("https://arbor-the-tree-production.up.railway.app/book")[ 문제집 추가 / 삭제 ],
                        content: [
                            #image("./book-grid-input.png", width: 100%)
                        ],
                    )
                    #v(rem(1))
                    #shadowed-round-box(
                        title: link("https://arbor-the-tree-production.up.railway.app/check")[ 오답 체크 ],
                        content: [
                            #image("./review-check.png", width: 100%)
                        ],
                    )
                ],
                [
                    #shadowed-round-box(
                        title: link("https://arbor-the-tree-production.up.railway.app/progress")[ 진도표 페이지 ],
                        content: [
                            #image("./progress.png", width: 100%)
                        ],
                    )
                    #v(rem(1))
                    #shadowed-round-box(
                        title: link("https://arbor-the-tree-production.up.railway.app/assignment")[ 오답 과제 목록 ],
                        content: [
                            #image("./review-assignment.png", width: 100%)
                        ],
                    )
                ],
            )
            #v(rem(1))
            #link(<how-to-use-arbor-the-tree>)[테스트 계정 이용 안내]
        ]
    ]
]
