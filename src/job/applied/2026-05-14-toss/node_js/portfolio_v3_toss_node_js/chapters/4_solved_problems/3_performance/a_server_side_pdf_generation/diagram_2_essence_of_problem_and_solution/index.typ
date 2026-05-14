#import "../../../../../components/rem/index.typ": rem
#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/fletcher_component/index.typ": (
    arrow, black_node, blank_node, diagram, dotted_line, line, white_node,
)
#import "@preview/fletcher:0.5.8" as fletcher: diagram as fletcher_diagram, edge, node
#import "./latency_comparision_chart/index.typ": latency_comparision_chart

#let diagram_2_essence_of_problem_and_solution = [
    #shadowed-round-box[
        #latency_comparision_chart
    ]
]





