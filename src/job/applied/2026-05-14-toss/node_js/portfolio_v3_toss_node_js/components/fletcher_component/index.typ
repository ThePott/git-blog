#import "@preview/fletcher:0.5.8" as fletcher: diagram as fletcher_diagram, edge, node
#import "../rem/index.typ": rem

#let arrow(a, b, label: "", paint: black, ..args) = {
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

#let dotted_line(a, b, label: "", paint: black, ..args) = {
    paint = paint.darken(25%)
    if (label != "") {
        edge(a, b, text(paint, label), "--", stroke: paint, label-side: center, ..args)
    } else {
        edge(a, b, "--", stroke: paint, label-side: center, ..args)
    }
}

#let black_node(pos, label) = {
    node(pos, text(fill: white, label), fill: black)
}

#let white_node(pos, label) = {
    node(pos, label, fill: white, stroke: black)
}

#let blank_node(pos, label) = {
    node(pos, label, fill: white)
}

#let diagram(spacing_x: 4, spacing_y: 1, ..arguments) = {
    fletcher_diagram(
        node-defocus: 0,
        spacing: (rem(spacing_x), rem(spacing_y)),
        edge-stroke: 1pt,
        crossing-thickness: 5,
        mark-scale: 100%,
        ..arguments,
    )
}
