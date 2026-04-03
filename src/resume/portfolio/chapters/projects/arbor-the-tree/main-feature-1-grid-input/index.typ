#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

#let main-feature-1-grid-input = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
        (level: 2, title: "1. 그리드 인풋 및 다중 입력", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "그리드 인풋")
            - 구글 스프레드 시트와 유사한 UI
            - custom data attribute `data-coordinate`을 이용한 키보드 내비게이션

            #v(rem(1))
            #heading(level: 2, "다중 입력")
            - 셀에 `/` 입력 시, 자동으로 알맞는 값을 오버레이, 그 밑의 빈 셀 모두에 같은 값 오버레이
            - 문제 번호에 `~` 입력 시, 해당 번호들을 자동 완성 (예: `확인 1~10`)
            - 문제 번호 끝에 `-` 입력 시, 해당 셀부터 끝까지의 문제 번호 삭제 (예: `122-`)

            #v(rem(1))
            #heading(level: 2, "유효성 검사")
            - 문제 번호 없이 다른 열의 값 기입 시 오류 알림
            - 자동 완성할 것이 더 이상 없을 때 `/`를 사용 시 오류 알림
            - 문제 번호가 없는 행에서는 자동 완성 비활성화
            #heading(level: 3, "해결한 문제")
            - 빠른 반응을 위해 유효성 검사 셀 수를 최소화하려 하였으나, 해당 로직이 너무 복잡해지고 버그가 많아짐
            - 모든 입력마다 전체 셀 유효성 검사를 하되, 가상 스크롤(TanStack Virtual)을 이용해 돔 노드를 최소화하여
                20.38ms에서 2.28ms로 반응 시간 89% 단축(`console.time`으로 측정)
        ],
        [
            #shadowed-round-box(
                title: [Grid Input],
                subtitle-array: (
                    link("https://arbor-the-tree-production.up.railway.app/book/create")[
                        문제집 등록 페이지
                    ],
                    link(<how-to-use-arbor-the-tree>)[
                        테스트 계정 이용 안내
                    ],
                ),
                content: [
                    #image("./grid-input.png", width: 100%)
                ],
            )
        ],
    )
]
