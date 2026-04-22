#let easy_interface = [
    Arbor The Tree로 해결한 과제

    1. 쉬운 사용법

    a. 칸반 진도표
    - 기존 진도표의 문제와 그 해결
    - Troubleshooting: 드롭다운이 스크롤바에 잘림

    b. 그리드 인풋
    - 기존 문제집 등록 과정의 문제
    - 후보 기술 스택
    - 문제의 본질 파악
    - Troubleshooting: 유효성 검사 성능 개선
    - Troubleshooting: 키보드 내비게이션

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    a. 칸반 진도표

    기존 진도표의 문제와 그 해결

    - 기존 진도표 사용 흐름
        1. 구글 시트에 문제 묶음을 복사 붙여넣기
        2. 묶음 이름 옆에 진행 상황을 키워드로 기록
        3. 이를 출력하여 학생 책상 위에 배치

    - 기존 진도표의 문제점
        1. 전체 진도표를 한 페이지에 넣다보니 글씨가 너무 작아짐
        2. 당일 수업과 무관한 것이 페이지의 대부분
        3. 조건부 포매팅 규칙을 지켜야만 사용 가능

    - 해결책
        - 열(column)별 분리 스크롤
            - 문제집별 스크롤 칸반 보기
        - 드롭다운에서 묶음 상태 설정 (숙제, 오늘, 해제)
        - 당일 수업에 필요한 부분만 요약 보기

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    a. 칸반 진도표

    Troubleshooting: 드롭다운이 스크롤바에 잘림

    현상 관찰
    - 열 컴포넌트의 자식으로 들어간 드롭다운이 스크롤바에 잘림

    해결책
    - `createPortal`을 이용해 컴포넌트를 `document.body`로 빼냄
    - `position: fixed` 하에서의 위치는 Floating UI 라이브러리로 계산

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    기존 문제집 등록 과정의 문제




]
