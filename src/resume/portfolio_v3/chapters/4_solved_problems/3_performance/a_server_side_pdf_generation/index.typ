#import "../../../../components/title-section/index.typ": title-section
#import "../../../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_many_ways_to_generate_pdf/index.typ": diagram_1_many_ways_to_generate_pdf
#import "./diagram_2_essence_of_problem_and_solution/index.typ": diagram_2_essence_of_problem_and_solution


#let a_server_side_pdf_generation = [
    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 3. 성능 최적화"),
        (level: 2, size: "md", title: "a. 서버 사이드 PDF 생성"),
        (level: 3, size: "lg", title: "PDF 생성 방법과 그 문제"),
    )
    #two-column-section(
        [
            - 배경: 오답과제를 pdf로 생성 후 출력 후 숙제로 부여
                - 학생들의 오답의 쪽, 문제 번호가 적혀있는 빈 학습지 제작해야
                - 여러 학생 것을 한 번에 제작한다면 100쪽 이상도 가능
            - 후보 기술 스택
                - React PDF(client side)
                    - 브라우저 메인 스레드 점유
                    - 30쪽 이상의 pdf 생성 시에는 Web Worker 사용 권장
                - Puppeteer(server side)
                    - 브라우저 가상화 도구에 pdf 생성 기능이 딸려있을 뿐
                - Typst(server side)
                    - LaTex보다 빠르고 문법이 쉬운 문서 조판 언어
        ],
        [
            #diagram_1_many_ways_to_generate_pdf
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 3. 성능 최적화"),
        (level: 2, size: "md", title: "a. 서버 사이드 PDF 생성"),
        (level: 3, size: "lg", title: "문제의 본질 파악과 그 해결"),
    )
    #two-column-section(
        [
            - 문제의 본질: PDF는 문서다
                - 브라우저와도, html과도 무관하다
            - 해결
                1. 오답 과제 pdf 생성 request -> 오답 과제 내의 문제 쿼리
                2. Typst template 생성 -> PDF로 컴파일
                3. respond with PDF
            - 성과(ReactPDF 대비)
                - 8쪽 생성 시간 4.7% 단축
                - 80쪽 생성 시간 30.7% 단축
                - 800쪽 생성 시간 61.3% 단축
                - PDF 생성이 브라우저 메인 스레드를 점유하지 않아 사용자 조작에 반응
        ],
        [
            #diagram_2_essence_of_problem_and_solution
        ],
    )
]
