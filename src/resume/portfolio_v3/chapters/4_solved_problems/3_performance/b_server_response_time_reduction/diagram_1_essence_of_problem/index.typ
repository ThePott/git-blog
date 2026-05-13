#import "../../../../../components/rem/index.typ": rem
#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)
#import "@preview/fletcher:0.5.8" as fletcher: diagram as fletcher_diagram, edge, node

#let diagram_1_essence_of_problem = [
    #shadowed-round-box[
        #diagram(
            spacing_x: 1,
            spacing_y: 4,

            white_node((0, 0), "최초 응답"),
            white_node((0, 1), "7초 가량"),
            line((0, 0), (0, 1)),

            white_node((2, 0), "그 이후 응답"),
            white_node((2, 1), "4~5초 가량"),
            line((2, 0), (2, 1)),
            edge((0, 1), (2, 1), "--", label: "간극: cold start", bend: -30deg),

            dotted_line((1, 2), (1, 3)),
            dotted_line((2, 1), "d,d,l", label: "far region"),
            black_node((1, 3), "Neon 로고"),
            black_node((0, 4), "must cold start"),
            black_node((2, 4), "region fixed to\nN. Virginia"),
            line((1, 3), (0, 4)),
            line((1, 3), (2, 4)),
        )
    ]

]
