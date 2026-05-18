#import "../../../../components/rem/index.typ": rem
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)
#import "@preview/fletcher:0.5.8" as fletcher: diagram as fletcher_diagram, edge, node

#let diagram_1_where_bottleneck_is = [
    #shadowed-round-box[
        #diagram(
            spacing_x: 4,
            spacing_y: 2,

            blank_node((1, 0), "기존 흐름"),
            blank_node((2, 0), "변경점"),
            blank_node((0, 1), "학생"),

            white_node((1, 1), "오답 체크"),
            white_node((1, 2), "진도표 갱신"),
            black_node((2, 2), "DB"),
            edge((1, 1), "r,d", "-|>", [자동 저장], label-pos: 0.2),
            edge((2, 2), (1, 2), "-|>", [완료 여부 갱신]),
            edge((2, 2), "d,d,d,d,l", "-|>", [완료 여부 갱신], label-pos: (4, 0.5), label-side: left),
            edge((2, 2), (1, 4), "--|>", [수동 입력 불필요], label-pos: 0.5, label-side: center),

            blank_node((0, 4), "강사"),
            white_node((1, 4), "구글 시트에 오답 체크 입력"),
            white_node((1, 5), "오답 과제 생성"),
            white_node((1, 6), "새 진도표 제작"),
            white_node((1, 7), "(반복)"),
            line((1, 1), (1, 7)),
        )
    ]
]



