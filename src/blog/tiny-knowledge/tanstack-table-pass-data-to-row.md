# tanstack table에서 행에 데이터 저장하기(넘기기)

## 배경

- extendedAssignment array를 받음 -> row Array 제작
- columns: 버튼 클릭하면 원본 extendedAssignment를 이용해 pdf 제작해야 함

## 모든 row prop이 column에 사용될 필요는 없다. <- 데이터 보관용, 화면 출력용이 달라도 된다!

### 데이터 저장에 사용할 row prop 설정

```tsx
type Row = {
    assigned_at: string // NOTE: ISOString
    book_title_array: string[]
    question_count: number
    assignment: extendedAssignment // NOTE: not going to be printed
}
```

### column def 에서 해당 row prop에 접근

```tsx
const columns = [
    // ... other columns
    columnHelper.display({
        id: "preview",
        header: "미리 보기",
        cell: ({ row }) => {
            const assignment = originalData?.[row.index]
            return (
                <Button
                    onClick={async () => {
                        const pdfBlob = await pdf(<AssignmentPdf assignment={assignment} />).toBlob()
                        const url = URL.createObjectURL(pdfBlob)
                        window.open(url)
                    }}
                >
                    <BookOpen />
                </Button>
            )
        },
    }),
]
```
