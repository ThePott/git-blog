#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/rem/index.typ": rem

#let diagram_2_with_psql = [
    #shadowed-round-box(inset: 0)[
        #image("./images/database-speed-wrong-region.png")
    ]

    #v(rem(2))
    #shadowed-round-box(inset: 0)[
        #image("./images/database-speed-internal-network.png")
    ]
]
