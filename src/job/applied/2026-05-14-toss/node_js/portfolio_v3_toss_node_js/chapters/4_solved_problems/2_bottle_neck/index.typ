#import "../../../components/rem/index.typ": rem
#import "../../../components/title-section/index.typ": title-section
#import "../../../components/override-enum-numbering/index.typ": override-enum-numbering
#import "../../../components/two-column-section/index.typ": two-column-section
#import "./diagram_1_where_bottleneck_is/index.typ": diagram_1_where_bottleneck_is
#import "./diagram_2_ui_benchmark/index.typ": diagram_2_ui_benchmark, diagram_2_ui_benchmark_hotel_checkbox
#import "./diagram_3_troubleshoot_nested_virtual_scroll/index.typ": diagram_3_troubleshoot_nested_virtual_scroll

#let bottle_neck = [
    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제"),
        (level: 2, size: "lg", title: "2. 병목 현상 해결"),
    )
    #two-column-section(
        [
            #override-enum-numbering(numbering: "a.")[
                1. 오답 체크 결과 자동 반영
                    - 병목 현상 발생 지점과 그 해결
                    - UI 벤치마크: 호텔 예약의 다중 선택 UI
                    - Troubleshooting: 다층 구조 가상 스크롤
            ]
        ],
        [], // NOTE: MUST BE BLANK
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 2. 병목 현상 해결"),
        (level: 2, size: "md", title: "a. 오답 체크 결과 자동 반영"),
        (level: 3, size: "lg", title: "병목 현상 발생 지점과 그 해결"),
    )
    #two-column-section(
        [
            - 수업 종료 시의 기록물에서 병목 현상 발생
                - 학생이 개별적으로 오답 체크
                    - 강사가 모아서 구글 시트에 기록
                - 학생이 개별적으로 인쇄된 진도표에 완료 표시
                    - 강사가 모아서 구글 시트에 동기화
            - 해결 방안: 오답 체크와 DB, 진도표 동기화
                1. 웹앱에 오답 체크 $arrow.r$ DB에 저장
                2. DB에 오답 체크 저장 $arrow.r$ 묶음 완료 여부 업데이트
                3. 진도표 캐시 무효화 $arrow.r$ 묶음 완료 여부 업데이트 된 진도표 fetch

                this is what
        ],
        [
            #diagram_1_where_bottleneck_is
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 2. 병목 현상 해결"),
        (level: 2, size: "md", title: "a. 오답 체크 결과 자동 반영"),
        (level: 3, size: "lg", title: "UI 벤치마크: 호텔 예약의 다중 선택 UI"),
    )
    #two-column-section(
        [
            - 요구사항: 모바일에서 스크롤 없이 오답 체크 가능해야
                - 한 수업 당 약 40문제 오답 체크
                - 기존 방식처럼 한 줄에 한 문제 표시하면 스크롤을 많이 해야 함
            - 아이디어: 호텔 예약의 다중 선택 UI
                - 그리드 체크박스에서 시작과 끝 선택 $arrow.r$ 그 사이도 자동 선택
                - 이후 단일 선택으로 다른 상태 기록할 수 있게

            #diagram_2_ui_benchmark_hotel_checkbox
        ],
        [
            #diagram_2_ui_benchmark
        ],
    )

    #pagebreak()
    #title-section(
        (level: 1, size: "sm", title: "Arbor The Tree로 해결한 과제: 2. 병목 현상 해결"),
        (level: 2, size: "md", title: "a. 오답 체크 결과 자동 반영"),
        (level: 3, size: "lg", title: "Troubleshooting: 다층 구조 가상 스크롤"),
    )
    #two-column-section(
        [
            - 배경: 다층 구조의 데이터 스키마 및 컴포넌트
                - book $supset$ topic $supset$ step $supset$ question
                    - 가상화 라이브러리는 직속 children만 가상화
            - 문제 발생: 최상위 부모(book)가 통째로 가상화됨
                - 가상화 라이브러리는 직속 children만 가상화
                - 중첩 가상화 불가: book 전체가 한 단위로 mount / unmount
            - 원인: 컴포넌트의 다층 구조와 시각적 줄 단위 구조의 불일치
            - 해결: 다층 구조를 줄 단위로 평탄화, 이후 가상 스크롤
        ],
        [
            #diagram_3_troubleshoot_nested_virtual_scroll
        ],
    )
]
