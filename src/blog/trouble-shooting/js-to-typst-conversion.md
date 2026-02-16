# js 값을 typst 값으로 변환하는 데 오류 발생

- 발생 시각: 2026-02-16 11:00
- 문제: js 값을 typst 값으로 옳게 변환했는데 컴파일 오류 발생
- 해결 시각: 2026-02-16 14:52

## 배경

- node fs로 typst 파일을 만들기 위해 js 값(object, array, ...)을 typst 문법에 맞게 변환
- prisma에서 받아온 데이터를 사용하기 전까진 정상 작동함
- prisma에서 받아온 데이터로 변환을 하자 컴파일 에러

```typ
#handout-per-student(
  book-data-array: (
    (
      title: "완전 새 문제집 완전 새로움",
      topics: (
        (
          title: "[I] 1. 다항식의 연산",
          questions: (
            (
              name: "1",
              page: 1,
              solution_page: 1,
            ),
          ),
        )
      ),
    )
  ),
  student-name: "홍길동",
  date-string: "2026-02-16",
)
```

```zsh
error: cannot access fields on type array
   ┌─ typst-template/components/handout-per-student.typ:34:29
   │
34 │   let book-title = book-data.title
   │                              ^^^^^

help: error occurred in this call of function `handout-per-book`
   ┌─ typst-template/components/handout-per-student.typ:55:4
   │
55 │ ╭     handout-per-book(
56 │ │       student-name: student-name,
57 │ │       date-string: date-string,
58 │ │       book-data: book-data,
59 │ │     )
   │ ╰─────^

help: error occurred in this call of function `handout-per-student`
   ┌─ assignment_1771220983354.typ:9:1
   │
 9 │   #handout-per-student(
   │ ╭──^
10 │ │   book-data-array: (
11 │ │     (
12 │ │       id: 86,
   · │
38 │ │   date-string: "2026-02-16",
39 │ │ )
   │ ╰─^
```

## 분석

### 실패 원인

- 가장 내부의 최소 단위부터 하나하나 다시 만들어봄
- 정상 작동 코드를 만들고 위의 코드와 비교
- 배열에 trailing comma가 있고 없고의 차이 발견

### 해결책

- 배열 변환할 때 trailing comma 추가

```ts
const stringArray = source.map((el) => makeTypstData(el))
const stringified = stringArray.toString()
const typstArray = `(${stringified},)` // NOTE: trailing comma 추가
```
