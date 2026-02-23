# Prisma unique constraint에서 nullable 값을 포함시켰는데 null 값 포함해서 쿼리하는 게 불가능해짐

- 발생 시각: 2026-02-20 16:50
- 문제: Prisma unique constraint에서 nullable 값을 포함시켰는데 null 값 포함해서 쿼리하는 게 불가능해짐
- 해결 시각: 2026-02-20: 18:16

## 배경

- 클라이언트는 review_check_id 없이 review_check의 upsert, delete를 요청
- 다른 반에 같은 학생이 등록되고 같은 실라버스를 사용하게 될 경우에도 오답 체크를 분리해서 관리하기 위해 review_check 에
  classroom_id를 포함함
- (classroom_id === null)이면 개별 수업을 뜻함
- review check를 id 없이 특정할 수 있게 기존의 unique constraint를 아래와 같이 바꿈

```prisma
// old
  @@unique([session_id, student_id, question_id])
// new
  @@unique([session_id, classroom_id, student_id, question_id])
```

- review_check을 특정짓기 위해 아래와 같이 쿼리

```ts
prismaClient.review_check.upsert({
    where: {
        session_id_classroom_id_student_id_question_id: {
            student_id,
            classroom_id,
            question_id: BigInt(question_id),
            session_id,
        },
    },
    //...
}
```

```
Diagnostics:
1. typescript: Type 'bigint | null' is not assignable to type 'number | bigint'.
     Type 'null' is not assignable to type 'number | bigint'. [2322]
```

## 분석

### 실패 원인

#### 최초 실패

- unique constraint에 들어가는 것은 언제나 truthy value여야 함. (null is falsy)
- `@@unique` 관련 공식 문서: https://www.prisma.io/docs/orm/reference/prisma-schema-reference#unique-1

> @@unique
>
> Defines a compound unique constraint for the specified fields.
>
> Remarks
>
> General
>
> All fields that make up the unique constraint must be mandatory fields. The following model is not valid because id
> could be null:
>
> ```prisma
> model User {
> firstname Int
> lastname  Int
> id        Int?
> @@unique([firstname, lastname, id])
> }
> ```

#### unique constraint를 두 개 사용

```prisma
  @@unique([session_id, student_id, question_id])
  @@unique([session_id, classroom_id, student_id, question_id])
```

- 반만 다른 걸 또 생성하려고 하면 첫 번째 제한에 걸림

#### classroom_id를 필수 항목으로 넣고 classroom_id가 null일 땐 -1을 부여

- -1 값을 가진 걸 참조할 수 없어서 실패

#### 한 학생은 한 실라버스를 한 번만 풀 수 있게 변경

- 반에 학생 등록할 때 반에 할당된 실라버스를 이미 풀고 있는지 확인해야 함
- 반에 실라버스 추가할 땐 해당 실라버스를 이미 할당받은 학생이 있는지 확인해야 함

### 해결책: 한 학생은 한 실라버스를 한 번만 풀 수 있게 변경

- 클라이언트 측에서 review_check_id를 받도록 수정 << 최초의 제약을 푼다
- 그러면 어떻게 해야 하는 거야, classroom_id는 포함을 해 말아? <<< 하지 말자. 안 하는 게 더 편하겠다.
- 아니야 그냥 유효성 검사를 하자. 그리고 한 학생이 같은 문제집을 여러번 푸는 예외적인 경우는 무시하자
