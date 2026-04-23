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

    - 현상 관찰
        - 열 컴포넌트의 자식으로 들어간 드롭다운이 스크롤바에 잘림

    - 해결책
        - `createPortal`을 이용해 컴포넌트를 `document.body`로 빼냄
        - `position: fixed` 하에서의 위치는 Floating UI 라이브러리로 계산

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    기존 문제집 등록 과정과 그 문제

    - 기존 문제집 등록 흐름
        - 구글 시트에 문제의 id, 쪽, 문제 번호 등의 정보를 기록
        - 반복적으로 입력해야 하는 부분에서는 자동 채우기 혹은 formula 사용

    - 개선해야 했던 것
        - 작성 중에는 놓친 부분이 있는지 파악하기 어려움
            - formula로 다 채우기 이전에는 변경 지점이 `/`로만 보임
        - 유효성 검사 부재
            - 아르바이트생에게 맡기기에 걱정됨

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    후보 기술 스택

    - 기존의 작업 환경인 구글 시트와 유사한 UI 제작하려 함
        - AG Grid (부분 유료, 1년 999 달러)
            - 다중 선택, formula는 유료 기능
        - Jspreadsheet CE (무료)
            - 바닐라 JavaScript 라이브러리
            - 선언적으로 컴포넌트 생성 삭제가 불가능
        - TanStack Table (무료)
            - Headless UI Library
            - 모든 셀, 행, 열의 데이터에 언제든 접근 가능

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    문제의 본질

    - 필요한 기능들은 스프레드 시트에 종속되지 않는다
        - 1씩 증가 자동 채우기: 마우스 드래그를 할 필요가 없다
        - 빈 곳 채우기: formula가 아니어도 채워지면 된다
        - 변환값 미리 보기: spreadsheet에 원래 없는 기능이다
        - 유효성 검사: spreadsheet에 원래 없는 기능이다


    - 결론: TanStack Table로 직접 구현
        - 테이블 형식이 필요한 것이지 스프레드 시트가 필요한 것이 아니다

    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    Troubleshooting: 유효성 검사 성능 개선

    - 문제 발생: 느린 유효성 검사
        - 유효성 검사를 하는 셀을 최소화하려다보니 예외 규칙과 더불어 버그가 많아짐
        - 검사 안정성 높이기 위해 모든 셀 검사
        - 2000행 x 7열의 돔 노드가 업데이트
    - 해결: 가상 스크롤
        - TanStack Virtual로 돔 노드 최소화
        - 업데이트 시간을 20.28ms에서 2.28ms로 89% 단축 (`performance.time`으로 측정)


    #pagebreak()
    Arbor The Tree로 해결한 과제 1. 쉬운 사용법

    b. 그리드 인풋

    Troubleshooting: 키보드 내비게이션

    - 문제 발생: 구글 시트보다 조악한 키도드 내비게이션
        - 모든 셀은 `<input />`일 뿐이라 키보드 이동은 tab만 지원
        - 방향키로 이동 불가
        - 엔터로 아래 셀 이동 불가

    - 해결: custom data attribute
        1. `data-coordinate={...}` 부여
        2. 방향키, 엔터 입력 시 다음 coordinate 계산
        3. querySelector로 목적지 돔 노드 선택
        4. focus





]
