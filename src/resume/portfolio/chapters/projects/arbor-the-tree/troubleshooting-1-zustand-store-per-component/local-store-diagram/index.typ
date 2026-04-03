#import "@preview/fletcher:0.5.8" as fletcher: diagram, edge, node
#import "../../../../../components/rem/index.typ": rem

#let quad(a, b, label, paint, ..args) = {
    paint = paint.darken(25%)
    if (label != "") {
        edge(a, b, text(paint, label), "-|>", stroke: paint, label-side: center, ..args)
    } else {
        edge(a, b, "-|>", stroke: paint, label-side: center, ..args)
    }
}

#let local-store-diagram = [
    #set text(fill: white)
    #box(width: 100%, fill: white, inset: rem(1))[
        #align(center)[
            #diagram(
                node-defocus: 0,
                spacing: (1cm, 1cm),
                edge-stroke: 1pt,
                crossing-thickness: 5,
                mark-scale: 100%,
                node-fill: luma(0%),
                node-outset: 3pt,

                node((0, -2), "`innerProps`", fill: gray),
                quad((0, -2), (0, -1), "props", gray),
                node((0, -1), "`createLocalStore(...)`"),


                node((-0.75, 0), "`passedProps`", fill: gray),
                quad((-0.75, 0), (-0.5, 1), "props", gray),

                quad((0, -1), (-0.5, 1), "const", black, label-pos: 0.25),
                node((-0.5, 1), "`LocalStoreProvider`"),
                quad((-0.5, 1), (-0.5, 2), "`createStore`", black),
                node((-0.5, 2), "`localStore`"),
                quad((-0.5, 2), (-0.5, 3), "pass to value", black),

                node((-0.5, 3), "`Context.Provider`"),

                quad((0, -1), (0.5, 1), "const", black, label-pos: 0.25),
                node((0.75, 0), "selectorFn", fill: gray),
                quad((0.75, 0), (0.5, 1), "props", gray),
                node((0.5, 1), "`useLocalStore`"),
                quad((0.5, 1), (0.5, 2), "`useContext`", black),
                node((0.5, 2), "`localStore`"),
                quad((0.5, 2), (0.5, 3), "props", black),
                node((0.5, 3), "`useStore`"),
            )
        ]
    ]
]
