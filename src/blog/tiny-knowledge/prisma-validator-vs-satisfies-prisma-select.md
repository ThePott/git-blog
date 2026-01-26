# select, where를 별도 변수로 분리할 때 `satisfies Prisma.syllabusSelect` vs `Prisma.validator<Prisma.syllabusSelect>`

## `satisfies`

- 변수 내 autocomplete 제공
- 단 result의 type은 default type(all scalars, no relations)

## `validator` (Recommended)

- 변수 내 autocomplete 제공
- result의 type도 제공
