#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/rem/index.typ": rem

#let diagram_2_solution_for_original_progress = [
    // - 스크린샷: 문제집별 진도표, 드롭다운 열기
    //     - 말풍선: 문제집별 스크롤
    //     - 말풍선: 드롭다운으로 묶음 상태 설정
    // - 스크린샷: 요약 진도표
    //     - 당일 수업에 필요한 부분만 요약 보기

    #shadowed-round-box(inset: 0)[
        #image("./images/progress-1.png")

        #place(top + left, dx: rem(2), dy: rem(8))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                #text("드롭다운으로\n묶음 상태 선택")
            ]
        ]

        #place(top + left, dx: rem(21), dy: rem(12))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                #text("열별 스크롤")
            ]
        ]
    ]

    #v(rem(2))
    #shadowed-round-box(inset: 0)[
        #image("./images/progress-2.png")
        #place(top + left, dx: rem(4), dy: rem(0))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                요약: 전 숙제, 오늘, 새 숙제만 필터
            ]
        ]
    ]
]
