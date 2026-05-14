#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/rem/index.typ": rem

#let diagram_2_library_candidats = [
    #shadowed-round-box[
        #table(
            columns: 3,
            stroke: none,
            inset: (x: rem(1), y: rem(1.5)),
            align: horizon,
            [], [*Expensive*], table.vline(), [*Cheap*],
            [*Imperative*], [], image("./images/jspreadsheet-ce.png"),
            table.hline(),
            [*Declarative*],
            image("./images/ag-grid.png"),
            image("./images/tanstack-table.png"),
        )
    ]
]
