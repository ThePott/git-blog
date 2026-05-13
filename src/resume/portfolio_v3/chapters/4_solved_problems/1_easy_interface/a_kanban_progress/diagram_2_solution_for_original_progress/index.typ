#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/rem/index.typ": rem

#let diagram_2_solution_for_original_progress = [
    // - 스크린샷: 문제집별 진도표, 드롭다운 열기
    //     - 말풍선: 문제집별 스크롤
    //     - 말풍선: 드롭다운으로 묶음 상태 설정
    // - 스크린샷: 요약 진도표
    //     - 당일 수업에 필요한 부분만 요약 보기

    #figure(caption: "문제집 별 스크롤 및 드롭다운으로 상태 변경")[
        #shadowed-round-box(inset: 0)[
            #image("./images/progress-1.png")
        ]
        #v(rem(1))
    ]

    #v(rem(2))
    #figure(caption: [
        당일 수업 요약 보기
    ])[
        #shadowed-round-box(inset: 0)[
            #image("./images/progress-2.png")
        ]
        #v(rem(1))
    ]
]
