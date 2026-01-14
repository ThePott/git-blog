# 조인 테이블 만들 때 unique 조건 걸기

```prisma
model session_question {
    id          BigInt   @id @default(autoincrement())
    session_id  BigInt
    question_id BigInt
    session     session  @relation(fields: [session_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
    question    question @relation(fields: [question_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

    @@unique([session_id, question_id])  // Prevents same question added twice to same session
}
```
