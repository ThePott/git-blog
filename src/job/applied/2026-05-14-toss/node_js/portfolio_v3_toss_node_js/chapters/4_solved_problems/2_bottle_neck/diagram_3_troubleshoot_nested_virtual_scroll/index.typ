#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

#let diagram_3_troubleshoot_nested_virtual_scroll = [
    #shadowed-round-box(inset: 0)[
        #image("./images/checkbox-1.png")

        #place(top + left, dx: rem(1), dy: rem(0.4))[
            #box(stroke: white, inset: rem(0.5), width: rem(30.3), height: rem(17))[
                #place(top + right)[
                    #text(fill: white, "TopicSection")
                ]
            ]
        ]

        #place(top + left, dx: rem(2), dy: rem(2))[
            #box(stroke: white, inset: rem(0.5), width: rem(28.3), height: rem(9.7))[
                #place(top + right)[
                    #text(fill: white, "StepSection")
                ]
            ]
        ]

        #place(top + left, dx: rem(3), dy: rem(3.6))[
            #box(stroke: white, inset: rem(0.5), width: rem(26.3), height: rem(2.5))[
                #place(top + right)[
                    #box(fill: black, inset: (x: rem(1), y: rem(0.5)))[
                        #text(fill: white, "PagenaetedBox")
                    ]
                ]
                #place(top + right)[
                    #box(fill: black, inset: (x: rem(1), y: rem(0.5)))[
                        #text(fill: white, "PagenaetedBox")
                    ]
                ]
            ]
        ]
    ]
    #v(rem(2))
    #shadowed-round-box(inset: 0)[
        #image("./images/checkbox-1.png")

        #place(top + left, dx: rem(1), dy: rem(0.2))[
            #box(stroke: white, inset: rem(0.5), width: rem(30), height: rem(1.2))[
                #place(horizon + right)[
                    #text(fill: white, "TitleHeader")
                ]
            ]
        ]
        #place(top + left, dx: rem(1), dy: rem(2))[
            #box(stroke: white, inset: rem(0.5), width: rem(30), height: rem(1.2))[
                #place(horizon + right)[
                    #text(fill: white, "SubtitleHeader")
                ]
            ]
        ]
        #place(top + left, dx: rem(1), dy: rem(3.4))[
            #box(stroke: white, inset: rem(0.5), width: rem(30), height: rem(2.7))[
                #place(horizon + right)[
                    #box(inset: (x: rem(1), y: rem(0.5)), fill: black)[
                        #text(fill: white, "ReviewCheckPagenated")
                    ]
                ]
            ]
        ]
    ]
]

// - 스크린샷: 오답체크
//     - 그룹화: topic, step, pagedQuestions
//     - 말풍선: 가장 바깥의 topic이 통째로 mount/unmount
// - 스크린샷: 오답체크
//     - 그룹화: flatten한 것들
//     - 말풍선: 시각적 줄 단위 가상화
