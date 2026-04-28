#import "../../rem/index.typ": rem

#let list_settings(content) = {
    show list: it => {
        counter("list-depth").step()
        [
            #it
        ]
        counter("list-depth").update(d => d - 1)
    }

    show list.item: it => {
        let item_position = state("item_position", none)
        context {
            let depth = counter("list-depth").get().first()

            let location = here()
            item_position.update(location.position())
            let is_first = item_position.get() == none

            let size = rem(1)
            if depth == 0 { size = rem(1.5) }

            let weight = "regular"
            if depth == 0 { weight = "bold" }
            if depth == 1 { weight = "bold" }

            let top_margin = rem(0.5)
            if depth == 0 and is_first { top_margin = rem(1) }
            if depth == 0 and not is_first { top_margin = rem(4) }
            if depth == 1 { top_margin = rem(1) }

            set text(size: size, weight: weight)
            [
                #v(top_margin)
                #it
            ]
        }
    }

    content
}
