#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_essence_of_problem/index.typ": diagram_1_essence_of_problem
#import "./diagram_2_with_psql/index.typ": diagram_2_with_psql

#let b_server_response_time_reduction = [
    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 3. 성능 최적화"),
        (level: 2, size: "md", title: "b. 서버 응답 시간 단축"),
        (level: 3, size: "lg", title: "문제의 본질 파악 및 해결 시도"),
    )
    #two-column-section(
        [
            - 시스템 구성
                - API 서버: Railway
                - DB 서버: Neon(PostgreSQL)
            - 현상 관찰: 아주 긴 최초 응답 시간, 이후의 긴 응답 시간
                - 연속 요청 시, 최초에는 7초 가량, 이후에는 4\~5초 가량 소요
                - 최초의 긴 응답 시간은 cold start 의심됨
                - 최초 응답 이후에도 긴 응답 시간은 region 자체가 먼 것이 의심됨
            - 진단 및 해결 시도
                - Railway region 변경: 달라지지 않음
                - Neon은 설정 변경 불가
                    - 무료 플랜은 cold start 강제
                    - region은 N. Virginia 하나
        ],
        [
            #diagram_1_essence_of_problem
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 3. 성능 최적화"),
        (level: 2, size: "md", title: "b. 서버 응답 시간 단축"),
        (level: 3, size: "lg", title: "해결: PostgreSQL DB on Railway"),
    )
    #two-column-section(
        [
            - DB 서버를 PostgreSQL로 Railway에 직접 배포
                - Railway는 상시 가동 인스턴스로 cold start 없음
            - API 서버와 DB 서버의 network latency 최소화
                - 모두 한국과 제일 가까운 Singpore region으로 설정
                - 같은 private network로 설정하여 roundtrip latency 단축
            - 성과
                - 문제집 생성 시간 315 ms로 단축 (22배 향상)
        ],
        [
            #diagram_2_with_psql
        ],
    )
]
