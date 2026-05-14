#let override-enum-numbering(numbering: "a.", content) = {
    show enum: set enum(numbering: numbering)
    content
    show enum: set enum(numbering: "1.")
}
