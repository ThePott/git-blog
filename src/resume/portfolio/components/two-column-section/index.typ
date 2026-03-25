#let two-column-section(first, second) = [
  // #set rect(
  //   inset: 8pt,
  //   fill: rgb("e4e5ea"), // Set a background color
  //   radius: 5pt, // Apply rounded corners to all rects
  //   width: 100%,
  //   height: 100%,
  // )
  // #show grid.cell: it => {
  //   rect(it.body) // A show rule to automatically wrap the content of each grid cell in a rect
  // }

  #grid(
    columns: (1fr, 1fr),
    gutter: 1em,
    first, second,
  )
]
