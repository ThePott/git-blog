#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/rem/index.typ": rem

#let diagram_1_problem_of_original_progress = [
    #shadowed-round-box[
        #image("./images/google-sheet-progress.png")
    ]

    #place(top + left, dx: rem(20), dy: rem(2))[
        #box(fill: black, inset: (x: rem(1), y: rem(0.5)))[
            #text(fill: white)[
                너무 작은 글씨
            ]
        ]
    ]

    #place(top + left, dx: rem(10), dy: rem(14))[
        #box(fill: black, inset: (x: rem(1), y: rem(0.5)))[
            #text(fill: white)[
                당일 수업과 관계 없는 부분 많음
            ]
        ]
    ]


    #place(top + left, dx: rem(2), dy: rem(4))[
        #box(fill: black, inset: (x: rem(1), y: rem(0.5)))[
            #text(fill: white, "조건부 포매팅\n적용 범위\n깨뜨리지 말아야")
        ]
    ]
]
