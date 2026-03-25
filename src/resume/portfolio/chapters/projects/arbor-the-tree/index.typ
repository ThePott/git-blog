#import "../../../components/two-column-section/index.typ": two-column-section
#import "../../../components/title-section/index.typ": title-section

#let chapter-project-arbor-the-tree = [
  = Arbor The Tree - 진도 및 오답 관리 시스템
  == 기획 의도
  === 강사 재직 시절, 구글 시트와 파이썬을 이용해 사용한 진도 및 오답 관리 시스템을 웹앱으로 제작
  == 주요 기능
  === 그리드 인풋 및 다중 입력
  ==== 특수 문자 입력으로 자동 입력, 자동 삭제를 하여 이용 편의성 증진
  ==== 가상 스크롤로 그리드 인풋의 반응 속도를 4초에서 0.3초로 단축하며, 유효성 검사는 유지
  === 오답 그리드 및 다중 선택
  ==== 가상 스크롤로 그리드 체크박스의 반응 속도를 0.3초에서 0.1초로 단축
  ==== 오답 체크를 할 때마다 진도 캐시를 무효화하여 해당 문제 묶음의 완료 여부를 갱신
  == 주요 기능 외 해결한 문제
  === 서버 응답 속도 개선: 7s -> 0.3s
  === typst compiler를 활용한 pdf 생성으로, react-pdf 대비 생성시간 90% 단축
  === props drilling, re-render 문제를 컴포넌트별 Zustand 스토어로 해결

  #pagebreak()
  #title-section(
    (level: 1, title: "Arbor The Tree - 주요 기능", size: "sm"),
    (level: 2, title: "1. 그리드 인풋 및 다중 입력", size: "lg"),
  )
  #two-column-section(
    [
      #heading(level: 2, "그리드 인풋")
      - 구글 스프레드 시트와 유사한 UI
      #heading(level: 2, "다중 입력")
      - 셀에 `/` 입력 시, 자동으로 알맞는 값을 채우고 그 밑의 빈 셀 모두에 같은 값 채움
      #heading(level: 2, "유효성 검사")
      - 문제 번호 없이 다른 열의 값 기입 시 오류 알림
      - 문제 번호가 없는 행에서는 자동 완성 비활성화
      #heading(level: 3, "해결한 문제")
      - 빠른 반응을 위해 유효성 검사 셀 수를 최소화하려 하였으나, 해당 로직이 너무 복잡해지고 버그가 많아짐
      - 모든 입력마다 전체 셀 유효성 검사를 하되, 가상 스크롤(TanStack Virtual)을 이용해 돔 노드를 최소화하여 (TODO: 반응 속도 재기)로 반응되게 함
    ],
    [여기에는 이미지가 들어갈 것],
  )
]
