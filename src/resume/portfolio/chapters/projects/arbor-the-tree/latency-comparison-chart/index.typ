#import "@preview/primaviz:0.5.3": *
#import "../../../../components/rem/index.typ": rem
#let data = json("./data.json")


#let latency-comparison-chart = box(fill: white, width: 100%, inset: (x: rem(1)))[
    #grouped-bar-chart(
        width: 90%,
        height: 50%,
        title: "React-pdf vs compiling typst to PDF",
        y-label: "latency (ms)",
        data,
    )
]
