#import "/src/job/general/portfolio/portfolio_v3/chapters/1_cover/index.typ": cover
#import "/src/job/general/portfolio/portfolio_v3/chapters/2_table_of_content/index.typ": table_of_content
#import "/src/job/general/portfolio/portfolio_v3/chapters/3_problems_to_solve/index.typ": problems_to_solve
#import "/src/job/general/portfolio/portfolio_v3/chapters/4_solved_problems/index.typ": solved_problems
#import "/src/job/general/portfolio/portfolio_v3/chapters/5_additional_infos/index.typ": additional_info
#import "/src/job/general/portfolio/portfolio_v3/components/rem/index.typ": rem
#import "/src/job/general/portfolio/portfolio_v3/components/page-setting/index.typ": page-setting

#show: page-setting

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
    #box(width: 100%, height: 98%)[
        #place(center, dy: 40%)[
            #stack(dir: ttb)[
                #v(rem(0))
                #text(size: rem(3), weight: "bold", "하흥주: Software Engineer")
                #v(rem(1.5))
                #text(size: rem(1.5), weight: "semibold", "트렌드보다 본질, 복잡함보다 명료함")
                #v(rem(1))
                #text(size: rem(1), weight: "semibold", "문제를 정확히 정의하고, 단순한 해결책을 만듭니다")
            ]
        ]

        #place(bottom + right, contact)
    ]
]
#cover
#table_of_content
#problems_to_solve
#solved_problems
#additional_info
