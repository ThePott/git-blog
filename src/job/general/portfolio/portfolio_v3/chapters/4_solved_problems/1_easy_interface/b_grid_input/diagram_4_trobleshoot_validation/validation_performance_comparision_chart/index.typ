#import "@preview/primaviz:0.5.3": bar-chart
#import "../../../../../../components/rem/index.typ": rem
#let data = json("./data.json")


#let validation_performance_comparision_chart = box(fill: white, width: 100%)[
    #bar-chart(
        width: 80%,
        height: 50%,
        title: "Validation update time\nwith/without virtualized scroll",
        y-label: [
            #v(rem(1))
            update time (ms)
        ],
        data,
    )
]
