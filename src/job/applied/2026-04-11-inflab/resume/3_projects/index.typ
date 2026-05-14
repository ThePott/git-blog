#let projects = [
    = 프로젝트

    == Arbor The Tree 오답관리 시스템

    === 시스템적 수업 관리
    *해결한 문제*
    - 기존 파이썬 시스템의 느린 속도
        - 진도표와 오답 과제 현황을 수기로 동기화 (학생당 5분, 수업당 50~100분 소요)
    - 강사의 기억에 의존하던 진도 추적
        - 자동화된 진도 관리로 전환
    - 학생에게만 맡기던 오답 관리
        - 시스템으로 추적 가능하게 개선
    *주요 성과*
    - 서버 응답 속도 7초 → 0.3초로 단축 (22배 향상)
        - Neon DB의 cold start, region 문제 분석 후 Railway PostgreSQL로 교체
        - API와 DB를 동일 internal network에 배포하여 round-trip latency 최소화
    - 그리드 입력 반응 시간 20.38ms → 2.28ms로 단축 (89% 향상)
        - TanStack Virtual을 이용한 가상 스크롤로 DOM 노드 최소화
    - PDF 생성 시간 단축 및 브라우저 부담 제거
        - 서버 사이드 Typst 컴파일 도입으로 react-pdf 대비 80쪽 기준 30.7% 단축
        - 브라우저 메인 스레드 점유 없이 PDF 생성
    - 모바일 사용자 경험 고려한 반응형 구현 (랜딩, 회원가입, 권한 요청 페이지)
    *기술적 해결*
    - 컴포넌트별 Zustand 스토어: Context API 대신 createStore 팩토리 패턴으로 props-drilling, re-render 문제 해결
    - 커스텀 배포 스크립트: npm install로 설치되지 않는 Typst compiler, font 파일을 Railway 배포 시 자동 설치
    - RESTful API 설계: 프론트엔드와 분리된 API 서버 구축 (https://github.com/ThePott/api-of-arbor-the-tree)

    == Harpooning Tmux 세션 관리자

    === 어떤 프로젝트든 바로 열고 닫고 이동하기
    *해결한 문제*
    - 프로젝트 간 이동을 빠르게 하려고 Tmux를 사용했으나, 세션이 많아짐에 따라 원하는 프로젝트가 부착된 세션을 찾는 데에
    - 시간이 오래 걸리게 됨
    - ThePrimeagen이 만든 harpoon은 NeoVim에서의 즐겨찾기로 페이지를 등록, 관리, 이동하게 해주고 tmux-sessionizer는
    - 컴퓨터 전체에서 프로젝트 폴더를 빠르게 검색하고 세션으로 추가하게 해줬으나, Tmux의 세션을 harpoon처럼 관리할 수
        없음
    - 즐겨찾기 목록에 적힌 세션 이름의 순서대로 단축키가 적용되게 하여 빠르게 세션 간 이동
    - 즐겨찾기 목록과 실제 세션을 양방향 동기화
    *기술적 해결*
    - vim 바깥에서 vim motion을 사용할 수 있도록 tmux-popup 안에서 vim 실행
        - 마크다운의 체크박스 [ ]를 [x]로 체크하고 종료하면 해당 세션을 선택할 수 있게 함
        - grep으로 체크된 줄을 찾고 sed로 체크박스를 제외한 세션 이름을 추줄, 해당 세션으로 이동
    *주요 성과*
    - 새 프로젝트를 tmux 세션으로 등록하는 시간을 평균 25.3초에서 0.8초로 단축 (31배 향상)
    - 세션 간 이동 시간 단축: 목록 순서대로 숫자 단축키(0~9)로 즉시 이동 가능
    - 손쉬운 세션 정리: 목록 삭제만으로 실제 세션 종료 및 세션 종료시 즐겨찾기 목록에서도 삭제
]
