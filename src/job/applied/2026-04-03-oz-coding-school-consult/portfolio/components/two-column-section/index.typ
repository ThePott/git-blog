#import "../rem/index.typ": rem

#let two-column-section(first, second) = [
    #grid(
        columns: (1fr, 1fr),
        gutter: rem(3),
        first, second,
    )
]
