#import "../../../../../components/rem/index.typ": rem
#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)
#import "@preview/fletcher:0.5.8" as fletcher: diagram as fletcher_diagram, edge, node

#let diagram_3_essence_of_problem = [
    #shadowed-round-box[
        #diagram(
            spacing_x: 1,
            spacing_y: 8,

            black_node((0, 0), "기존에 스프레드 시트로 해결했다\n!= 스프레스 시트가 본질이다"),
            blank_node((0, 1), image(height: rem(2), "./images/tanstack-table.png")),
            arrow((0, 0), (0, 1), label: "자동 채우기\n유효성 검사", label-side: left),
        )
    ]
]


