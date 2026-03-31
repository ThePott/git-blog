#import "../../../../components/two-column-section/index.typ": two-column-section
#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../components/rem/index.typ": rem
#import ".././latency-comparison-chart/index.typ": latency-comparison-chart

#let main-feature-2-server-side-pdf = [
    #title-section(
        (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
        (level: 2, title: "2. 서버 사이드 PDF 생성", size: "lg"),
    )
    #two-column-section(
        [
            #heading(level: 2, "최초 계획: 클라이언트 사이드 PDF 생성")
            - React-pdf를 이용한 클라이언트 사이드 PDF 생성 계획
            - 해당 작업이 브라우저 메인 스레드를 차지함
            - #link("https://react-pdf.org/advanced")[때문에 30쪽 이상의 PDF 생성 시, 웹 워커 사용이 권장됨]
            - 의문: pdf는 브라우저와 상관 없는데 웹 워커까지 써야 하나?

            #v(1em)
            #heading(level: 2, "개선안: compile typst to PDF")
            - request > create typst file > compile to PDF > respond
            #heading(level: 3, "troubleshooting")
            - 문제 1: typst는 npm install로 설치 되지 않음
            - 문제 2: typst, font 파일은 `tsc`로 빌드되지 않음
            - 해결: `railway.json`에 `buildCommand` bash script를 작성
                1. typst compiler 설치
                2. `npm run build`
                3. build에서 제외되는 파일들 dist 폴더로 이동
                    - typst template files
                    - font

            #v(1em)
            #heading(level: 2, "성과")
            - 8쪽 생성 시간 4.7% 단축
            - 80쪽 생성 시간 30.7% 단축
            - 800쪽 생성 시간 61.3% 단축
            - PDF 생성이 브라우저 메인 스레드를 점유하지 않아 사용자 조작에 반응
        ],
        [#figure(
            caption: [PDF Generation Time Comparison
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
