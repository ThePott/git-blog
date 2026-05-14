#import "../rem/index.typ": rem

#let title-body-box(title, body, is-empty: false) = {
    let bottom-inset = if is-empty { rem(1) } else { rem(3) }
    grid(
        columns: (1fr, 3fr),
        gutter: rem(1),
        grid.cell(title),
        grid.cell(
            inset: (top: rem(1), bottom: bottom-inset),
            stroke: (top: (paint: blue, thickness: 4pt, cap: "round")),
            body,
        ),
    )
}
