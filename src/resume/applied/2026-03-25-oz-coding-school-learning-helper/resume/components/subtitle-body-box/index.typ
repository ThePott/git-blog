#let subtitle-body-box(subtitle, body) = {
    grid(
        columns: (1fr, 3fr),
        gutter: 1em,
        grid.cell(subtitle),
        grid.cell(body),
        inset: (top: 1em, bottom: 3em),
    )
}
