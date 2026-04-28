#import "../../rem/index.typ": rem

#let list_settings(content) = {
    show list: it => {
        counter("list-depth").step()
        it
        counter("list-depth").update(d => d - 1)
    }

    let list_position = state("list_position", none)
    context {
        let location = here()
        list_position.update(location.position())
    }

    show list.item: it => {
        let item_position = state("item_position", none)
        context {
            let location = here()
            item_position.update(location.position())

            let depth = counter("list-depth").get().first() + 1

            if depth == 1 {
                let is_first = item_position.get() == none
                let top_margin = if is_first { rem(1) } else { rem(4) }

                set text(size: rem(1.5), weight: "bold")
                [
                    #v(top_margin)
                    #it
                ]
            } else if depth == 2 {
                set text(size: rem(1.25), weight: "bold")
                [
                    #v(rem(1))
                    #it
                ]
            } else {
                set text(size: rem(1), weight: "regular")
                [
                    #it
                ]
            }
        }
    }

    content
}
