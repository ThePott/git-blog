#import "@preview/shadowed:0.3.0": shadow
#import "../rem/index.typ": rem

#let shadowed_round_box(content) = [
    #shadow(blur: 12pt, fill: rgb(89, 85, 101, 30%), radius: 12pt, dy: 12pt, spread: -6pt)[
        #shadow(blur: 24pt, fill: rgb(89, 85, 101, 15%), radius: 24pt, dy: 24pt, spread: -12pt)[
            #box(
                width: 100%,
                radius: rem(1),
                clip: true,
                fill: white,
                inset: rem(0),
            )[
                #align(center)[
                    #content
                ]
            ]
        ]
    ]
]

