// tit6e-info: (title: string, size: "sm" | "md" | "lg", level: int)
#let size-to-em = (
  sm: 13pt,
  lg: 20pt,
)
#let title-section(..args) = {
  for title-info in args.pos() {
    let level = title-info.level
    let size = size-to-em.at(title-info.size)
    let title = title-info.title

    stack(dir: ttb, text(size: size, weight: "bold", title))
    v(6pt)
  }
  v(11pt)
}
