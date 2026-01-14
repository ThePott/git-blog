# prisma request takes too long time

- 발생 시각: 2025-12-30 20:47
- 문제: prisma request를 하는 데에 시간이 4초 가까이 걸림
- 해결 시각: 2025-12-30 20:58

## 배경

- 구조: book <- topic <- step <- question
- 목표: `await`에 소요되는 시간을 최소화
- 방법: concurrent하게 요청

## 분석

### 실패 원인

| Operation           | Count | Notes                               |
| ------------------- | ----- | ----------------------------------- |
| book.create         | 1     | Sequential (must get book_id first) |
| topic.create        | 3     | Parallel ✅                         |
| step.create         | 6     | Parallel per topic ✅               |
| question.createMany | 6     | Parallel per step ✅                |

- Total: 16 separate database round-trips
- Even with parallelism, you still have sequential dependencies:
- book.create (await)
  → topic.create (await, need book_id)
  → step.create (await, need topic_id)
  → question.createMany (need step_id)
- Each level must wait for the parent to complete. With network latency to the database (especially if remote), this adds up quickly.
  Key problems:

1. Many round-trips: Each create is a separate network request
2. Sequential dependency chain: 4 levels deep, each awaiting the previous
3. No transaction batching: Prisma doesn't batch these into a single query

### 해결: 한 번의 nested create으로 처리

- 한 번의 nested create으로 처리한다
- [Create a related record](https://www.prisma.io/docs/orm/prisma-client/queries/relation-queries#create-a-related-record)

```ts
export const dbCreateBook = async ({ title, published_year, data }: BookWritePayload) => {
    const groupedByTopic = Object.groupBy(data, ({ topic }) => topic)

    const bookResult = await prismaClient.book.create({
        data: {
            title,
            published_year,
            topics: {
                create: Object.entries(groupedByTopic).map(([topic, rowArrayOfTopic]) => ({
                    title: topic,
                    steps: {
                        create: Object.entries(Object.groupBy(rowArrayOfTopic!, ({ step }) => step)).map(
                            ([step, rowArrayOfStep]) => ({
                                title: step,
                                questions: {
                                    create: rowArrayOfStep!.map((row) => ({
                                        name: row.question_name,
                                        page: Number(row.question_page),
                                        solution_page: Number(row.solution_page),
                                    })),
                                },
                            }),
                        ),
                    },
                })),
            },
        },
    })

    return bookResult // TODO: 나중에 어떻게 보낼지 생각하자
}
```

### 지표

- 동시성 접근법
    - 최대: 6.2초
    - 최소: 1.8초
- 관계 접근법
    - 최대: 6.4초
    - 최소: 0.5초
- commit sha: 0c1785d
