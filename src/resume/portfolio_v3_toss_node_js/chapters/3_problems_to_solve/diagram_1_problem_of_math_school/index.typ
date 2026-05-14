#import "../../../components/rem/index.typ": rem
#import "../../../components/fletcher_component/index.typ": arrow, black_node, diagram, line, white_node
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box


#let diagram_1_problem_of_math_school = [
    #shadowed-round-box[
        #diagram(
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

