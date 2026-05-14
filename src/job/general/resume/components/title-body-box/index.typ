#let title-body-box(title, body, is-empty: false) = {
    let bottom-inset = if is-empty { 1em } else { 3em }
    grid(
        columns: (1fr, 3fr),
        gutter: 1em,
        grid.cell(title),
        grid.cell(
            inset: (top: 1em, bottom: bottom-inset),
            stroke: (top: (paint: blue, thickness: 4pt, cap: "round")),
            body,
        ),
    )
}
