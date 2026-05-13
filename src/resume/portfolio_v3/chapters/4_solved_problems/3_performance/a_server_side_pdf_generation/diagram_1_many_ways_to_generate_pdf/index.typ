#import "../../../../../components/rem/index.typ": rem
#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box

#let diagram_1_many_ways_to_generate_pdf = [
    #shadowed-round-box[
        #table(
            columns: 3,
            stroke: none,
            inset: rem(2),
            align: horizon,
            [], [*Client-Side*], table.vline(), [*Server-Side*],
            [*Heavy*], image("./images/react-pdf.png"), image("./images/puppeteer.svg"),
            table.hline(),
            [*Light*], [], image("images/typst.svg"),
        )
    ]
]
