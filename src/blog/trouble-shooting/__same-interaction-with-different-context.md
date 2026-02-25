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

- data 생긴 게 달라서 핸들링이 어렵다면 schema를 수정하는 게 맞나? << 하지만 schema는 깔끔한 거 같은데
- 그렇다면 두 개 모두 같은 형식으로 정리해서 넘겨야 하나? << 그럴싸 한데

### 실패 원인

#### common type을 생성, 달라지는 부분은 discriminated union으로 대응

##### 시도

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

```ts
// Separate prop types for each case
type SyllabusCheckboxProps = {
    forWhat: "syllabus"
    source: JoinedQuestion
    // ... other common props
}

type AssignmentCheckboxProps = {
    forWhat: "assignment"
    source: ExtendedReviewAssignmentQuestion & { assignment_id: string | null } // NOTE: 이건 따로 받아야 함.... 가능하긴 하겠는데
    // ... other common props
}

type CheckboxProps = SyllabusCheckboxProps | AssignmentCheckboxProps
```

##### 실패

- 일단 작동은 함
- 그러나 객체 구조가 너무 다르다

```ts
// TODO: 현재 문제
// TODO: 1. AssignmentQuestionWithExtraInfo 와 JoinedQuestionWithIndexInfo의 역할이 같은데 이름의 생김새는 너무 다르다
// TODO: 2. JoinedQuestionWithIndexInfo의 경우 makeFlat(util)에서 IndexInfo를 더한다 << 마찬가지로 assignmentQuesion에서도 그리 해야
// TODO: 3. JoinedQuestionWithIndexInfo의 경우 question 안에 기존 정보가 들어 있지만 AssignedQuestionWithExtraInfo는 그냥 1층에 원래 정보가 들어있다 ---- object의 생김새도 너무 다르다
// TODO: 4. 결과적으로 공유하고 있는게 많음에도 무엇을 공유하고 있는지 파악하기가 어렵다
// TODO: 5. AssignmentQuestionWithExtraInfo에서 assignmentQuestion 속성을 따로 만들면 review_check_status_visual 이 2층으로 들어가버려서 안 된다

export type JoinedQuestionWithIndexInfo = {
    question: Pick<Question, "id" | "name" | "page" | "order"> & {
        // NOTE: 여기 추가된 네 가지가 모두 서버에서 옴
        // NOTE: 예시
        // "questions": [
        //                 {
        //                     "order": 1,
        //                     "id": "2105",
        //                     "name": "1",
        //                     "page": 1,
        //                     "session_status": "HOMEWORK",
        //                     "review_check_id": "1038",
        //                     "review_check_status": "WRONG",
        //                     "review_check_status_visual": "WRONG",
        //                     "session_id": "88"
        //                 }
        //             ]
        review_check_status: ReviewCheckStatus | null
        review_check_status_visual: ReviewCheckStatus | null
        session_status: SessionStatus | null
        session_id: string | null
    } // NOTE: 얘가 checkbox의 source로 들어감
    // NOTE: util에서 평탄화할 때 주입
    indexInfo: IndexInfo
}

export type AssignmentQuestionWithExtraInfo = Omit<ReviewAssginmentQuestion, "status"> &
    CheckboxStatus & {
        assignment_id: string
        indexInfo: IndexInfo
    } // NOTE: 얘 자체가 checkbox의 source로 들어감 << 이 차이가 있었네
```

- 근본적으로는 다른 시기에 만들어진 두 타입이, 비슷한 역할을 하지만 이름을 너무 다르게 잡아서 각 사용처에서 사용하는
  방식이 달라져버렸다

### 해결책

- 이름을 비슷하게 만든다
- 사용처에서 두 타입의 이름이 대칭적인 걸 한눈에 확인할 수 있게 한다
- 자료 구조가 다른 게 문제라면 다른 자료 구조에 대응하느라 힘을 쓸 게 아니라 자료 구조를 같게 만드는 게 좋다
