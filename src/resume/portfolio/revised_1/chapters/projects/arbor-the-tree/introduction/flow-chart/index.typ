#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../../../../../components/rem/index.typ": rem

#let quad(a, b, label, paint, ..args) = {
    paint = paint.darken(25%)
    if (label != "") {
        edge(a, b, text(paint, label), "-|>", stroke: paint, label-side: center, ..args)
    } else {
        edge(a, b, "-|>", stroke: paint, label-side: center, ..args)
    }
}

#let flow-chart = [
    #set text(fill: white)
    #box(width: 100%, fill: white, inset: rem(1))[
        #align(center)[
            #diagram(
                node-defocus: 0,
                spacing: (1cm, 1cm),
                edge-stroke: 0.5pt,
                crossing-thickness: 5,
                mark-scale: 100%,
                node-fill: luma(0%),
                node-outset: 3pt,

                node((-2, 0), "카카오로 가입"),
                node((-1, 0), "권한 요청"),
                node((0, 0), "권한 관리"),
                node((0, 1), "반 관리"),
                node((0, 2), "문제집 추가 / 삭제"),
                node((0, 3), "진도 / 오답 관리"),
                node((1, 3), "진도표"),
                node((1, 4), "오답 체크"),
                node((1, 5), "오답 과제 생성"),
                node((1, 6), "오답 과제 목록"),
                node((2, 6), "pdf 생성"),

                // basic arrow
                quad((-2, 0), (-1, 0), "", black),
                quad((-1, 0), (0, 0), "", black),
                quad((0, 0), (0, 1), "", black),
                quad((0, 1), (0, 2), "", black),
                quad((0, 2), (0, 3), "", black),
                quad((0, 3), (1, 3), "", black),
                quad((1, 3), (1, 4), "", black),
                quad((1, 4), (1, 5), "", black),
                quad((1, 5), (1, 6), "", black),

                // update arrow
                quad((1, 4), "r,u,l", [모두 체크되면\ 진도표에 완료 표시], black),
                quad((1, 5), "r,u,l", [오답 체크 그리드 추가], black),
                quad((1, 5), "rrrr,uu,llll", [진도표에\ 해당 과제 추가], black, label-side: right),
                quad((1, 6), (2, 6), "", black),
            )
        ]
    ]
]
