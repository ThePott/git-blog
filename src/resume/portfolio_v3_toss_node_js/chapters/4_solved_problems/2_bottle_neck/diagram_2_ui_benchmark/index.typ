#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem
#import "../../../../components/stack/index.typ": hstack, vstack

#let diagram_2_ui_benchmark_hotel_checkbox = [
    #shadowed-round-box(inset: 0)[
        #image(width: 50%, "./images/hotel-checkbox.png")
    ]
]

#let diagram_2_ui_benchmark = [
    #shadowed-round-box(inset: 0)[
        #image("./images/checkbox-2.png")

        #place(top + left, dx: rem(10), dy: rem(23))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                #text("1. 수업 중 푼 문제 모두 정답으로 체크")
            ]
        ]
        #place(top + left, dx: rem(18), dy: rem(1))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                #text("2.   다중 선택 해제")
            ]
        ]
        #place(top + left, dx: rem(18), dy: rem(18))[
            #box(fill: white, inset: (x: rem(1), y: rem(0.5)))[
                #text("3. 오답(복습) 개별 체크")
            ]
        ]
    ]
]
// - 스크린샷: 호텔 양 끝 선택
//     https://www.hilton.com/en/book/reservation/rooms/?ctyhocn=SELSEDI&arrivalDate=2026-05-12&departureDate=2026-05-13&room1NumAdults=1&displayCurrency=KRW&aarpRate=
//     - 말풍선: 가장 최근 두 번 클릭 사이 선택
// - 스크린샷: 오답체크 정답 양 끝 선택
//     - 말풍선: 1. 푼 문제 모두 정답으로 체크
// - 스크린샷: 오답 개별 선택
//     - 말풍선: 2. 다중 선택 해제
//     - 말풍선: 3. 오답 단일 체크
