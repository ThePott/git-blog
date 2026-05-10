#import "@preview/fletcher:0.5.8" as fletcher: edge

#let arrow(a, b, label, paint, ..args) = {
    paint = paint.darken(25%)
    if (label != "") {
        edge(a, b, text(paint, label), "-|>", stroke: paint, label-side: center, ..args)
    } else {
        edge(a, b, "-|>", stroke: paint, label-side: center, ..args)
    }
}

#let line(a, b, label: "", paint: black, ..args) = {
    paint = paint.darken(25%)
    if (label != "") {
        edge(a, b, text(paint, label), "-", stroke: paint, label-side: center, ..args)
    } else {
        edge(a, b, "-", stroke: paint, label-side: center, ..args)
    }
}
