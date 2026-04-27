#let performance = [
    #pagebreak()
    Arbor The Tree로 해결한 과제

    3. 성능 최적화

    a. 서버 사이드 PDF 생성
    - PDF 생성 방법과 그 문제
    - 문제의 본질 파악과 그 해결
    - Troubleshooting: `npm install`로 설치 안 되는 것들 존재

    b. 서버 응답 시간 단축
    - 원인 진단: region, cold start
    - 해결과 그 성과


    #pagebreak()
    Arbor The Tree로 해결한 과제 3. 성능 최적화

    a. 서버 사이드 PDF 생성

    PDF 생성 방법과 그 문제

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

    #pagebreak()
    Arbor The Tree로 해결한 과제 3. 성능 최적화

    a. 서버 사이드 PDF 생성

    문제의 본질 파악과 그 해결

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


    #pagebreak()
    Arbor The Tree로 해결한 과제 3. 성능 최적화

    b. 서버 응답 시간 단축

    원인 진단: region, cold start

    - 시스템 구성
        - API 서버: Railway
        - DB 서버: Neon(PostgreSQL)

    - 문제 발생: 문제집 등록 시, 7초 가량이 걸림
        - 연속적으로 요청 보낼 시, 응답 시간이 4~5초로 줄어듦
        - 최초의 긴 응답 시간은 cold start 의심됨
        - 두 번째 이후에도 긴 응답 시간은 region 자체가 먼 것이 의심됨

    - 진단 및 해결 시도
        - Railway region 변경: 달라지지 않음
        - Neon은 설정 불가
            - 무료 플랜은 cold start 강제
            - region은 N. Virginia 하나

    #pagebreak()
    Arbor The Tree로 해결한 과제 3. 성능 최적화

    b. 서버 응답 시간 단축

    해결: PostgreSQL DB on Railway

    - DB 서버를 PostgreSQL로 Railway에 직접 배포
        - Railway는 상시 가동 인스턴스로 cold start 없음
    - API 서버와 DB 서버의 network latency 최소화
        - 모두 한국과 제일 가까운 Singpore region으로 설정
        - 같은 private network로 설정하여 roundtrip latency 단축
    - 성과
        - 문제집 생성 시간 315 ms로 단축 (22배 향상)
]
