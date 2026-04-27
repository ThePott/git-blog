#import "../../rem/index.typ": rem

#let list_setting(content) = {
    let check_is_new_list = state("is_new_list", true)
    let list_depth = counter("list-depth")

    show list: it => {
        list_depth.step()
        check_is_new_list.update(true) // NOTE: reset on new list

        context {
            let depth = list_depth.get().first()

            set text(size: rem(1.5), weight: "bold") if depth == 1
            set text(size: rem(1.25), weight: "bold") if depth == 2
            set text(size: rem(1), weight: "regular") if depth >= 3

            it
        }

        list_depth.update(d => d - 1)
    }

    show list.item: it => context {
        let depth = list_depth.get().first() + 1

        if depth == 1 {
            if check_is_new_list.get() {
                check_is_new_list.update(false)
                set text(size: rem(3), weight: "black")
                [
                    this is first
                    #check_is_new_list.get()
                    #depth
                    #it
                ]
            } else {
                [
                    this is not, but this is never detected
                    #check_is_new_list.get()
                    #depth
                    #v(rem(4))
                    #it
                ]
            }
        } else if depth == 2 {
            [
                #v(rem(2))
                #it
            ]
        } else {
            [
                #it
            ]
        }
    }

    content
}
