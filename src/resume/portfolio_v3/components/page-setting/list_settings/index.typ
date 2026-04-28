#import "../../rem/index.typ": rem

#let list_settings(content) = {
    // NOTE: 여기는 연속된 같은 레벨이 한 리스트가 된다
    // NOTE: level 1끼리, level 1 안의 level 2끼리
    show list: it => {
        counter("list-depth").step()
        let depth = counter("list-depth").get().first()
        //
        // let is_first = state("is_first", true)

        // // 이렇게 되면 리스트 안에 있는 섭 아이템들만 선택된다
        // show list.item: item_it => {
        //     context {
        //         let top_margin = rem(0)
        //         if depth == 0 and is_first.get() { top_margin = rem(4) }
        //         is_first.update(false)
        //         [
        //             #v(top_margin)
        //             #item_it
        //         ]
        //     }
        // }

        let bottom_margin = rem(0)
        if depth == 0 { bottom_margin = rem(4) }

        let size = rem(1)
        if depth == 0 { size = rem(1.5) }

        let weight = "regular"
        if depth == 0 { weight = "bold" }
        if depth == 1 { weight = "bold" }

        set text(size: size, weight: weight)
        [
            this is depth
            #depth
            #it
            #v(bottom_margin)
        ]
        counter("list-depth").update(d => d - 1)
    }

    // show list.item: it => {
    //     // let item_position = state("item_position", none)
    //     context {
    //         // let depth = counter("list-depth").get().first()
    //         //
    //         // let location = here()
    //         // item_position.update(location.position())
    //         // let is_first = item_position.get() == none
    //         //
    //         // let size = rem(1)
    //         // if depth == 0 { size = rem(1.5) }
    //         //
    //         // let weight = "regular"
    //         // if depth == 0 { weight = "bold" }
    //         // if depth == 1 { weight = "bold" }
    //         //
    //         // let top_margin = rem(0.5)
    //         // if depth == 0 and is_first { top_margin = rem(1) }
    //         // if depth == 0 and not is_first { top_margin = rem(4) }
    //         // if depth == 1 { top_margin = rem(1) }
    //         //
    //         // set text(size: size, weight: weight)
    //         [
    //             // #v(top_margin)
    //             #it
    //         ]
    //     }
    // }

    content
}
