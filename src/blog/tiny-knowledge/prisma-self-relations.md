# 프리즈마에서 스스로를 참조하는 모델 만들기

## source

- self relations: https://www.prisma.io/docs/orm/prisma-schema/data-model/relations/self-relations
- name attribute in relations: https://www.prisma.io/docs/orm/prisma-schema/data-model/relations#disambiguating-relations

## 관계 핵심

### 나를 참조하는 것들을 모아두는 관계 필드가 있어야 한다. 그 관계 필드에 연결되는 관계가 무엇인지 애매할 때 name attribute를 사용한다.

## example

```prisma
model question {
    id            BigInt @id @default(autoincrement())
    name          String @db.VarChar(255)
    page          Int
    solution_page Int
    step_id       BigInt
    step          step?  @relation(fields: [step_id], references: [id], onDelete: Cascade, onUpdate: NoAction)

    sub_question_id BigInt?
    sub_question    question?  @relation("SubQuestion", fields: [sub_question_id], references: [id], onDelete: Cascade, onUpdate: NoAction)
    super_question  question[] @relation("SubQuestion")
}
```
