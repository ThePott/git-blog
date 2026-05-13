#let hstack(content) = [
    #box(fill: green)[
        #stack(dir: ltr)[
            #content
        ]
    ]
]

#let vstack(content) = [
    #box(fill: yellow)[
        #stack(dir: ttb)[
            #content
        ]
    ]
]
