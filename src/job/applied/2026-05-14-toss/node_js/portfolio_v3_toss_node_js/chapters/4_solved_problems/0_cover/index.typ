#import "../../../components/rem/index.typ": rem
#import "../../../components/title-section/index.typ": title-section

#let cover = [
    #pagebreak()
    #title-section(
        (level: 1, size: "md", title: "Arbor The Tree 진도 관리 시스템으로"),
        (level: 1, size: "lg", title: "해결한 과제"),
    )

    1. 쉬운 사용법
        1. 칸반 진도표
        2. 그리드 인풋

    2. 병목 현상 해결
        1. 오답 체크 결과 자동 반영

    3. 성능 최적화
        1. 서버 사이드 PDF 생성
        2. 서버 응답 시간 단축
]
