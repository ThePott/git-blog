#import "../rem/index.typ": rem
#let hr = {
    let color = 210

    v(rem(1))
    line(length: 100%, stroke: 0.5pt + rgb(color, color, color))
    v(rem(1))
}
