#import "../rem/index.typ": rem

#let size-to-pt = (
    sm: rem(1.25),
    lg: rem(1.75),
)
#let title-section(..args) = {
    for title-info in args.pos() {
        let level = title-info.level
        let size = size-to-pt.at(title-info.size)
        let title = title-info.title

        stack(dir: ttb, text(size: size, weight: "bold", title))
        v(rem(0.5))
    }
    v(rem(2))
}
