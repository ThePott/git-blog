#import "../../../../../components/rem/index.typ": rem
#import "../../../../../components/shadowed-round-box/index.typ": shadowed-round-box
#import "../../../../../components/stack/index.typ": hstack, vstack


#let diagram_1_original_book_write_problem = [
    #shadowed-round-box[
        #table(
            columns: (1fr, 1fr, 1fr),
            stroke: none,
            [#text("1. 새 내용\n시작될 때 / 표시")], [#text("2. `/` 있는 셀만\n필터")], [#text("3. 드래그\n자동 완성")],

            [
                #table(
                    columns: 2,
                    [*쪽 \ 번호*], [*문제 \ 번호*],
                    [/], [1],
                    [], [2],
                    [], [3],
                    [], [4],
                    [/], [5],
                )
            ],
            [
                #table(
                    columns: 2,
                    [*쪽 \ 번호*], [*문제 \ 번호*],
                    [/], [1],
                    [/], [5],
                    [/], [9],
                    [/], [13],
                    [/], [17],
                )
            ],
            [
                #table(
                    columns: 2,
                    [*쪽 \ 번호*], [*문제 \ 번호*],
                    [1], [1],
                    [2], [5],
                    [3], [9],
                    [4], [13],
                    [5], [17],
                )
            ],

            [#text("4. 필터 해제")], [#text("5. formula로\n자동 채우기")], [],

            [
                #table(
                    columns: 2,
                    [*쪽 \ 번호*], [*문제 \ 번호*],
                    [1], [1],
                    [], [2],
                    [], [3],
                    [], [4],
                    [2], [5],
                )
            ],
            [
                #table(
                    columns: 2,
                    [*쪽 \ 번호*], [*문제 \ 번호*],
                    [1], [1],
                    [1], [6],
                    [1], [11],
                    [1], [16],
                    [2], [21],
                )
            ],
            [],
        )
    ]
    // - 스크린샷 찍어서 ai한테 typst 표로 만들어주자고 하자
    //     - 쪽 번호에 / 적고 자동완성 하는 과정 5단계 (이건 그림 참조)
    // - 비슷하게 표 그리기
    //     - 말풍선: (/에다가) 여기는 지금 몇 쪽이지?
    //     - 말풍선: (잘못 입력한 .에) 오입력을 감지 못함
]
