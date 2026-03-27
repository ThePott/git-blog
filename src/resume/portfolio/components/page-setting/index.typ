#import "../rem/index.typ": rem

#let page-setting(content) = {
    set text(
        font: "Noto Serif KR", // fallback chain
        size: rem(1),
    )

    set page(
        paper: "a4",
        margin: 2cm,
        flipped: true,
    )

    set par(
        first-line-indent: (amount: 1em, all: true),
        spacing: 0.65em,
        justify: true,
    )

    show heading.where(level: 1): set text(size: rem(2))
    show heading.where(level: 2): set text(size: rem(1.2))
    show heading.where(level: 3): set text(size: rem(1))

    {
        show link: underline
        content
    }
}

