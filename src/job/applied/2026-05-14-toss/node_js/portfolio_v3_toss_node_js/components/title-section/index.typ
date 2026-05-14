#import "../rem/index.typ": rem

#let size-to-pt = (
    sm: rem(1),
    md: rem(1.25),
    lg: rem(1.75),
    xl: rem(2),
)
#let size-to-weight = (
    sm: "semibold",
    md: "bold",
    lg: "bold",
    xl: "bold",
)

#let title-section(..args) = {
    for title-info in args.pos() {
        let level = title-info.level
        let title = title-info.title
        let size = size-to-pt.at(title-info.size)
        let weight = size-to-weight.at(title-info.size)

        stack(dir: ttb, text(size: size, weight: weight, title))
        v(rem(0.5))
    }
}
