# 다른 종류의 데이터를 같은 방법으로 상호작용을 할 때 비슷한 로직 두 개를 만들어야 하나?

- 발생 시각: 2026-02-25 12:35
- 문제: 문제집의 오답 체크를 구현한 뒤, 오답 과제의 오답 체크를 구현하려고 하는데 데이터가 달라 기존 로직 재사용이
  어려움
- 해결 시각:

## 배경

### 문제집 오답 체크에서 사용한 데이터 타입

```ts
// NOTE: 문제집 오답 체크 시 이것을 api로 보낸다
export type QuestionIdToRequestInfo = Record<
    string, // NOTE: question_id
    {
        status: ReviewCheckStatus | null // NOTE: use to delete if null
        review_check_id: string | null // NOTE: use to patch if exists
        topic_order: number
        step_order: number
        session_id: string | null // NOTE: session_id -> api에서 session 내의 문제 수와, 오답 체크된 문제 수를 비교해서 완료 여부 판단
    }
>
```

### 사용하는 데이터가 비슷하지만 다름

- `topic_order`, `step_order`의 경우 다중 선택 시 선택되는 것들을 추적하기 위함
    - 하지만 오답과제에서는 topic, step이 없음
    - title 역할은 bookTitleArray가, subtitle 역할은 bookTitle이 함
- `session_id`는 해당 세션의 문제 수와 오답 체크 수를 비교해 완료 여부를 판단하기 위함
    - 오답과제에서는 session의 역할을 `assignment`가 함
- 오답과제의 경우, `review_check_id` 대신 `review_assignment_question_id`가 필요함

### 의문

- 기존 속성이 다른 맥락도 겸하도록 해야 하나?
    - question_id가 review_assignment_question_id를 겸하도록 해야 하나?
    - session_id가 assignment_id를 겸하도록 해야 하나?
    - 하지만 이렇게 하면 관심사 분리가 안 되는 거 같은데

## 분석

### 실패 원인

#### 시도 1: common type을 생성, 달라지는 부분은 union type으로 대응

```ts
export type ReviewCheckChangedInfo =
    | {
          forWhat: "syllabus"
          status: ReviewCheckStatus | null
          orderInfo: OrderInfo // NOTE: optimistic update을 할 때 query data에서 target question을 찾는 데에 사용됨 -- `findJoinedQuestion`
          session_id: string // NOTE: session_id if syllabus, assignment_id otherwise
      }
    | {
          forWhat: "assignment"
          status: ReviewCheckStatus | null
          orderInfo: OrderInfo // NOTE: optimistic update을 할 때 query data에서 target question을 찾는 데에 사용됨 -- `findJoinedQuestion`
          assignment_id: string // NOTE: session_id if syllabus, assignment_id otherwise
      }

// NOTE: question_id if for syllabus, reivew_assignment_question_id otherwise
export type IdToChangedInfo = Record<string, ReviewCheckChangedInfo>
```

### 해결책
