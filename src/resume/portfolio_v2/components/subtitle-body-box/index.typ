#import "../rem/index.typ": rem

#let subtitle-body-box(subtitle, body) = {
    grid(
        columns: (1fr, 3fr),
        gutter: rem(1),
        grid.cell(subtitle),
        grid.cell(body),
    )
}
