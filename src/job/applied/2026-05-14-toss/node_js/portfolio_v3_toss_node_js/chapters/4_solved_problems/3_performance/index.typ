#import "../../../components/rem/index.typ": rem
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/override-enum-numbering/index.typ": override-enum-numbering
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./a_server_side_pdf_generation/index.typ": a_server_side_pdf_generation
#import "./b_server_response_time_reduction/index.typ": b_server_response_time_reduction


#let performance = [
    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree로 해결한 과제"),
        (level: 2, size: "lg", title: "3. 성능 최적화"),
    )
    #two-column-section(
        [
            #override-enum-numbering(numbering: "a.")[
                1. 서버 사이드 PDF 생성
                    - PDF 생성 방법과 그 문제
                    - 문제의 본질 파악과 그 해결
                    - Troubleshooting: `npm install`로 설치 안 되는 것들 존재
                2. 서버 응답 시간 단축
                    - 원인 진단: region, cold start
                    - 해결과 그 성과
            ]
        ],
        [], // NOTE: MUST BE BLANK
    )

    #a_server_side_pdf_generation
    #b_server_response_time_reduction
]
