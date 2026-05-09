#import "../../rem/index.typ": rem

// unified depth counter for both enum and list
#let list_settings(content) = {
    // Helper: get style based on depth
    let get_style(depth) = {
        let bottom_margin = rem(0)
        if depth == 0 { bottom_margin = rem(1.5) }

        let size = rem(1)
        if depth == 0 { size = rem(1.2) }

        let weight = "regular"
        if depth == 0 { weight = "bold" }
        if depth == 1 { weight = "semibold" }

        let top_margin = rem(0.5)
        if depth == 0 { top_margin = rem(4) }
        if depth == 1 { top_margin = rem(1) }

        (bottom_margin: bottom_margin, size: size, weight: weight, top_margin: top_margin)
    }

    let enum_list_it(it) = {
        context {
            counter("unified-depth").step()
            let depth = counter("unified-depth").get().first()
            let style = get_style(depth)

            set text(size: style.size, weight: style.weight)

            [
                #it
                #v(style.bottom_margin)
            ]

            counter("unified-depth").update(d => d - 1)
        }
    }

    let enum_list_item_it(it) = {
        context {
            let depth = counter("unified-depth").get().first()
            let style = get_style(depth)

            [
                #v(style.top_margin)
                #it
            ]
        }
    }

    show enum: it => enum_list_it(it)
    show enum.item: it => enum_list_item_it(it)

    show list: it => enum_list_it(it)
    show list.item: it => enum_list_item_it(it)

    content
}
