#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "flow-chart/index.typ": flow-chart

#let introduction = [
    = Arbor The Tree - 진도 및 오답 관리 시스템
    == 기획 의도
    - 강사 재직 시절, 구글 시트와 파이썬을 이용해 진도 및 오답 관리 시스템을 구축
    - 해당 시스템을 웹앱으로 제작
    == 사용자 흐름
    #shadowed-round-box(
        title: [User Flow],
        content: flow-chart,
    )
]
