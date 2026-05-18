#import "../rem/index.typ": rem
#import "../hr/index.typ": hr

#let page_setting(content) = {
    set text(
        font: "Noto Serif KR", // fallback chain
        size: rem(1),
    )

    set page(
        paper: "a4",
        margin: 2cm,
    )

    set par(
        // first-line-indent: (amount: 1em, all: true),
        spacing: rem(1.5),
        justify: true,
    )

    set list(marker: ("•", "◦", "▪"), indent: rem(2))

    show heading.where(level: 1): set text(size: rem(2), weight: "extrabold")
    show heading.where(level: 2): it => {
        hr
        v(rem(1))
        text(size: rem(1.5), weight: "extrabold", it.body)
    }
    show heading.where(level: 3): it => {
        v(rem(2))
        text(size: rem(1.25), weight: "extrabold", it.body)
    }

    show link: it => underline(text(fill: rgb("#0066cc"), it))

    content
}

