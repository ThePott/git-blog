# prisma migration error 발생 시 데이타 날리지 않고 해결하기

- 발생 시각: 2026-02-18 10:00
- 문제: 기존 migration을 수정하자 새 migration이 불가능해짐
- 해결 시각: 2026-02-18 11:14

## 배경

### 기존 데이터 지키기 위해 임시방편 migration 적용

- `book` 모델에는 `user_id`가 없었음
- 필수 항목으로 추가하기 위해 `@default(4)`, migrate -> drop default migrate
- 새 db에는 4번 user_id가 없어 migrate deploy 실패 -> migration 파일에서 `DEFAULT 1`으로 수정 -> prisma migrate resolve
  --apply (migration folder name)

### 새 db에서도 한 번에 migration 되도록 migration 파일 직접 수정

- 그러나 매번 새 db에 들어 있는 user_id에 맞춰 migration 파일 수정 -> resolve -> 마저 migrate 하기가 싫어 migration 파일
  직접 수정함
- add_user_id_to_book -> `NOT NULL DEFAULT 4;` -> `NOT NULL;`
- drop default migration -> (delete folder)
- 이후 migration을 시도하자 충돌 발생: 프로젝트의 migration != db migration
- db에서 문제가 되는 migration 삭제
- 다시 migration 시도

```zsh
Drift detected: Your database schema is not in sync with your migration
 history.

The following is a summary of the differences between the expected data
base schema given your migrations files, and the actual schema of the d
atabase.

It should be understood as the set of changes to get from the expected
schema to the actual schema.

[*] Changed the `book` table
  [+] Added column `user_id`
  [+] Added foreign key on columns (user_id)
```

## 분석

### 실패 원인

- add_user_id_to_book는 이제 db에 없기 때문에 migrate 하려고 함
- 그런데 user_id가 이미 있어서 열 추가가 불가능

### 해결책

- resolve --apply 이용: db에 적용하되, sql은 실행하지 않음
- 나머지 migrate
