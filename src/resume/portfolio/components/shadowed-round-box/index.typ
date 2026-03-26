#import "@preview/shadowed:0.3.0": shadow

#let shadowed-round-box(content) = [
    #shadow(blur: 12pt, fill: rgb(89, 85, 101, 50%), radius: 12pt, dy: 12pt, spread: -6pt)[
        #shadow(blur: 24pt, fill: rgb(89, 85, 101, 25%), radius: 24pt, dy: 24pt, spread: -12pt)[
            #box(
                width: 100%,
                radius: 1em,
                clip: true,
                content,
            )
        ]
    ]
]
