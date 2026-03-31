#import "@preview/primaviz:0.5.3": *
#import "../../../../components/rem/index.typ": rem
#let data = json("./data.json")


#let latency-comparison-chart = box(fill: white, width: 100%)[
    #grouped-bar-chart(
        width: 80%,
        height: 50%,
        title: "React-pdf vs compiling typst to PDF",
        y-label: [
            #v(rem(1))
            generation time (ms)
        ],
        data,
    )
]
