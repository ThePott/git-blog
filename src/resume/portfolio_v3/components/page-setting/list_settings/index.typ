#import "../../rem/index.typ": rem

#let list_settings(content) = {
    // NOTE: 여기는 연속된 같은 레벨이 한 리스트가 된다
    // NOTE: level 1끼리, level 1 안의 level 2끼리
    // state("is_first", true)

    show list: it => {
        counter("list-depth").step()
        let depth = counter("list-depth").get().first()
        // if depth == 0 { state("is_first").update(true) }

        let bottom_margin = rem(0)
        if depth == 0 { bottom_margin = rem(4) }

        let size = rem(1)
        if depth == 0 { size = rem(1.5) }

        let weight = "regular"
        if depth == 0 { weight = "bold" }
        if depth == 1 { weight = "bold" }

        set text(size: size, weight: weight)

        [
            #it
            #v(bottom_margin)
        ]

        counter("list-depth").update(d => d - 1)
    }

    // NOTE: 여기서는 패딩만
    show list.item: it => {
        context {
            let is_first = state("is_first").get()
            state("is_first").update(false)

            let depth = counter("list-depth").get().first()

            let top_margin = rem(0.5)
            if depth == 0 { top_margin = rem(4) }
            if depth == 1 { top_margin = rem(1) }

            [
                #v(top_margin)
                #it
            ]
        }
    }

    content
}
