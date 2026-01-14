# 가상 스크롤에서 실제 row index 얻기

- 발생일: 2025-12-29 21:59
- 문제: 가상 스크롤에서 실제 행의 번호를 얻을 수가 없음

## (문제: 시도한 것, 해결책)

### virtual row index에만 접근 가능

```tsx
<RoundBox ref={parentRef} padding="xl" isBordered className="h-[500px] overflow-auto">
    <div style={{ height: `${rowVirtualizer.getTotalSize()}px` }} className="relative w-full">
        {rowVirtualizer.getVirtualItems().map((virtualRow, virtualRowIndex) => (
            <Input
                key={virtualRow.index}
                defaultValue={String(virtualRowIndex)}
                style={{ transform: `translateY(${virtualRow.start}px)`, height: `${virtualRow.size}px` }}
                className="absolute top-0 left-0 w-full border border-amber-300"
            />
        ))}
    </div>
</RoundBox>
```

#### 시도한 것

- 공식 문서 예제 살펴보기

#### 해결책

`virtualRow.index`로 실제 인덱스에 접근

## 해결:

`virtualRow.index`로 실제 인덱스에 접근

## 소요 시간: 12분
