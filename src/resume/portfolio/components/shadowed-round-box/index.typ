#import "@preview/shadowed:0.3.0": shadow
#import "../rem/index.typ": rem

#let shadowed-round-box(title: (), subtitle-array: (), content: content) = [
    #figure(
        caption: [
            #title
            #v(rem(1))
            #for (index, subtitle) in subtitle-array.enumerate() {
                if (index != 0) {
                    v(rem(0.25))
                }
                subtitle
            }
        ],
        [
            #shadow(blur: 12pt, fill: rgb(89, 85, 101, 50%), radius: 12pt, dy: 12pt, spread: -6pt)[
                #shadow(blur: 24pt, fill: rgb(89, 85, 101, 25%), radius: 24pt, dy: 24pt, spread: -12pt)[
                    #box(
                        width: 100%,
                        radius: rem(1),
                        clip: true,
                        content,
                    )
                ]
            ]
            #v(rem(1.5))
        ],
    )
]
