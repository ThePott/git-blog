#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem

#let troubleshooting-2-reducing-latency = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능 외 해결한 문제", size: "sm"),
        (level: 2, title: "2. 서버 응답 속도 개선", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획: API In Railway, DB With Neon")
            - PostgeSQL 서버를 제공하는 Neon을 이용해 DB 구축
            - 문제: 문제집 생성할 때 응답까지 7초 가량 걸림
            - 원인 후보: network latency, cold start
            #heading(level: 3, "troubleshooting")
            - chaned Railway region from "US East (Virginia, USA)" to "Southeast Asia (Singapore)"
                - 응답 시간이 여전히 5\~7초
            - Neon의 free plan은 cold start가 강제됨
            - Neon의 region은 "AWS US East 1 (N. Virginia)" 하나 밖에 없음

            #v(rem(1))
            #heading(level: 2, "개선안: deploy my psql, also in railway")
            - 응답 속도 단축을 위해선
                1. cold start 없는 DB 서버 필요
                2. 최대한 가까운 region에 배포해야
            - Railway에 PostgeSQL 서버 배포
                - API와 DB를 같은 internal server에 배포하여 round-trip latency 최소화

            #v(rem(1))
            #heading(level: 2, "성과")
            - 문제집 생성 시간 315 ms로 단축 (22배 향상)
        ],
        [
            #shadowed-round-box(
                title: [Original Server Response Time],
                content: image("./database-speed-wrong-region.png"),
            )
            #v(rem(1))
            #shadowed-round-box(
                title: [Improved Server Response Time],
                content: image("./database-speed-internal-network.png"),
            )
        ],
    )
]
