#import "../../components/rem/index.typ": rem

#let contact = [
    #box()[
        #stack(dir: ttb)[
            #text("010-6332-9205")\
            #text("nusilite@gmail.com")\
            #text("https://github.com/thepott")
        ]
    ]
]

#let cover = [
    #box(width: 100%, height: 95%)[
        #place(center, dy: 40%)[
            #stack(dir: ttb)[
                #v(rem(0))
                #text(size: rem(3), weight: "bold", "하흥주: Frontend Developer")
                #v(rem(1.5))
                #text(size: rem(1.5), weight: "semibold", "트렌드보다 본질, 복잡함보다 명료함")
                #v(rem(1))
                #text(size: rem(1), weight: "semibold", "문제를 정확히 정의하고, 단순한 해결책을 만듭니다")
            ]
        ]

        #place(bottom + right, contact)
    ]
]
