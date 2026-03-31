#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem
#import ".././latency-comparison-chart/index.typ": latency-comparison-chart

#let main-feature-2-server-side-pdf = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
        (level: 2, title: "2. 서버 사이드 pdf 생성", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획: 클라이언트 사이드 pdf 생성")
            - `react-pdf/renderer`를 이용한 클라이언트 사이드 pdf 생성 계획
            - 해당 작업이 브라우저 메인 스레드를 차지함
            - #link("https://react-pdf.org/advanced")[때문에 30쪽 이상의 pdf 생성 시, 웹 워커 사용이 권장됨]
            - 의문: pdf는 브라우저와 상관 없는데 웹 워커까지 써야 하나?

            #v(1em)
            #heading(level: 2, "개선안: compile typst to pdf")
            - request > create typst file > compile to pdf > respond
            #heading(level: 3, "작업 중 발생한 문제와 그 해결")
            - 문제 1: typst는 npm install로 설치 되지 않음
            - 문제 2: typst, font 파일은 `tsc`로 빌드되지 않음
            - 해결: `railway.json`에 `buildCommand` bash script를 작성
                1. typst compiler 설치
                2. `npm run build`
                3. build에서 제외되는 파일들 dist 폴더로 이동
                    - typst template files
                    - font
        ],
        [#figure(
            caption: [Performance Comparison
                #v(rem(1))
                #link("https://arbor-the-tree-production.up.railway.app/test/pdf")[
                    성능 비교 테스트 페이지
                ]
            ],
            [
                #shadowed-round-box(latency-comparison-chart)
                #v(rem(1))
            ],
        )],
    )
]
