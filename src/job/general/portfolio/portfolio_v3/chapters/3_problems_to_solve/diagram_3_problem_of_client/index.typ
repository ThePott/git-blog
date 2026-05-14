#import "../../../components/rem/index.typ": rem
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)

#let diagram_3_problem_of_client = [
    #shadowed-round-box[
        #diagram(
            spacing_x: 4,
            spacing_y: 4,

            blank_node((0, 0), "학원 서비스"),
            black_node((-1, 1), "강의"),
            black_node((-1, 2), "원장"),
            white_node((1, 1), "학생 관리"),
            white_node((1, 2), "Arbor The Tree"),
            white_node((1, 3), "아르바이트생"),
            line((0, 0), (-1, 1)),
            line((-1, 1), (-1, 2)),
            line((0, 0), (1, 1)),
            line((1, 1), (1, 2)),
            line((1, 2), (1, 3)),
        )
    ]
]
