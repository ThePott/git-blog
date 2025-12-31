# 겹겹이 그루핑을 하고 싶을 땐 groupBy 보다 entries

## 내 코드

```ts
export const dbCreateBook = async ({ title, published_year, data }: BookWritePayload) => {
    const groupedByTopic = Object.groupBy(data, ({ topic }) => topic)
    const topicArray = Object.keys(groupedByTopic)
    const topicNest = Object.fromEntries(
        topicArray.map((topic) => {
            const rowArrayOfTopic = groupedByTopic[topic]
            if (!rowArrayOfTopic) throw new Error("---- grouping failed")

            const groupedByStep = Object.groupBy(rowArrayOfTopic, ({ step }) => step)
            return [topic, groupedByStep]
        })
    )

    const bookResult = await prismaClient.book.create({
        data: {
            title,
            published_year,
            topics: {
                create: topicArray.map((topic) => ({
                    title: topic,
                    steps: {
                        create: Object.keys(topicNest[topic]!).map((step) => ({
                            title: step,
                            questions: {
                                create: Object.keys(topicNest[topic]![step]!).map((row) => ({
                                    name: row.question_name,
                                    page: Number(row.question_page),
                                    solution_page: Number(row.solution_page),
                                })),
                            },
                        })),
                    },
                })),
            },
        },
    })

```

## ai 코드

```ts
export const dbCreateBook = async ({ title, published_year, data }: BookWritePayload) => {
    const groupedByTopic = Object.groupBy(data, ({ topic }) => topic)
    const bookResult = await prismaClient.book.create({
        data: {
            title,
            published_year,
            topics: {
                create: Object.entries(groupedByTopic).map(([topicTitle, topicRows]) => ({
                    title: topicTitle,
                    steps: {
                        create: Object.entries(Object.groupBy(topicRows!, ({ step }) => step)).map(
                            ([stepTitle, stepRows]) => ({
                                title: stepTitle,
                                questions: {
                                    create: stepRows!.map((row) => ({
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
    return bookResult
}
```

Key Changes

1. Use Object.entries() instead of Object.keys() - gives you both key and value in one pass
2. Removed the pre-computation of topicNest - do the grouping inline
