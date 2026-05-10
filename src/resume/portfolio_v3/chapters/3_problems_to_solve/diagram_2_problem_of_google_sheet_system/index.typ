#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../../../components/rem/index.typ": rem
#import "../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)
#import "../../../components/shadowed-round-box/index.typ": shadowed-round-box

#let diagram_2_problem_of_google_sheet_system = [
    #shadowed-round-box[
        #diagram(
            spacing_x: 1,
            spacing_y: 2,

            blank_node((0, 0), "수업 종료"),
            white_node((1, 0), "학생 1"),
            white_node((1, 2), "오답 체크"),
            white_node((1, 3), "진도표 갱신"),
            line((1, 0), (1, 2)),
            line((1, 2), (1, 3)),

            white_node((2, 0), "학생 10"),
            white_node((2, 2), "오답 체크"),
            white_node((2, 3), "진도표 갱신"),
            line((2, 0), (2, 2)),
            line((2, 2), (2, 3)),
            line((1, 3), (1, 5)),
            line((2, 3), (1, 5)),

            dotted_line((1, 0), (2, 0)),

            blank_node((0, 5), "수업 준비"),
            black_node((1, 5), "강사"),
            black_node((1, 7), "학생 1 수업 준비"),
            black_node((2, 7), "오답 체크를 DB에 입력"),
            black_node((2, 8), "오답 과제 생성"),
            black_node((2, 9), "새 진도표 제작"),
            black_node((1, 10), "학생 2 수업 준비 ..."),
            line((1, 5), (1, 7)),
            line((1, 7), (1, 8)),
            line((1, 8), (1, 9)),
            line((1, 9), (1, 10)),
            line((1, 7), (2, 7)),
            line((2, 7), (2, 8)),
            line((2, 8), (2, 9)),
        )
    ]
]
