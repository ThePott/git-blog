#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../../../components/rem/index.typ": rem
#import "../../../components/arrow/index.typ": arrow, line
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box

#let black_node(pos, label) = {
    node(pos, text(fill: white, label), fill: black)
}
#let white_node(pos, label) = {
    node(pos, label, fill: white, stroke: black)
}

#let diagram_1_problem_of_math_school = [
    #shadowed-round-box[
        #diagram(
            node-defocus: 0,
            spacing: (rem(4), rem(1)),
            edge-stroke: 1pt,
            crossing-thickness: 5,
            mark-scale: 100%,

            black_node((0, 0), "강사"),
            black_node((0, 2), "\"숙제 어디까지 했지?\""),
            black_node((0, 4), "\"여기까지 아니었어?\""),
            black_node((0, 6), "'???'"),
            black_node((0, 7), "\"일단 여기 풀어\""),

            white_node((1, 0), "학생"),
            white_node((1, 3), "\"여기요\""),
            white_node((1, 5), "\"아니었는데요\""),
            white_node((1, 8), "'???'"),
            white_node((1, 9), "'오늘 어디까지 하는 거지?'"),
            line((0, 0), (0, 2)),
            line((0, 2), (1, 3)),
            line((0, 4), (1, 3)),
            line((0, 4), (1, 5)),
            line((0, 6), (1, 5)),
            line((0, 6), (1, 5)),
            line((0, 6), (0, 7)),
            line((0, 7), (1, 8)),
            line((1, 8), (1, 9)),
        )
    ]
]

