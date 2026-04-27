#let page-setting(content) = {
    set text(
        font: "Noto Serif KR", // fallback chain
        size: 11pt,
    )

    set page(
        paper: "a4",
        margin: 2cm,
    )

    set par(
        first-line-indent: (amount: 1em, all: true),
        spacing: 0.65em,
        justify: true,
    )

    show heading.where(level: 1): set text(size: 2em)
    show heading.where(level: 2): set text(size: 1.2em)
    show heading.where(level: 3): set text(size: 1em)

    show link: underline
    content
}

