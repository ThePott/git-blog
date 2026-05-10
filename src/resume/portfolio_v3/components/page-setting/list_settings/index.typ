#import "../../rem/index.typ": rem

// unified depth counter for both enum and list
#let list_settings(content) = {
    show enum: set enum(numbering: "1. a. i.")

    // Helper: get style based on depth
    let get_style(depth) = {
        // 리스트 전체가 끝날 때의 밑 패딩
        // NOTE: 현재로서는 최고 노드마다 새 리스트로 인식되기 때문에 이 밑 패딩이 매번 추가된다
        // TODO: depth == 0에는 bottom_margin을 적용하고 top_margin을 제외한다. 그리고 title-section에 bottom_margin을 두어서 간격을 맞춘다
        let bottom_margin = rem(0)
        // if depth == 0 { bottom_margin = rem(4) }

        let size = rem(1)
        if depth == 0 { size = rem(1.2) }

        let weight = "regular"
        if depth == 0 { weight = "bold" }
        if depth == 1 { weight = "semibold" }

        // 각 리스트 아이템 시작되기 전의 위 패딩
        let top_margin = rem(0.5)
        if depth == 0 { top_margin = rem(4) }
        if depth == 1 { top_margin = rem(0.75) }

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
