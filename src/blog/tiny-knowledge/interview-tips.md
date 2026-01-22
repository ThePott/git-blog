# 제약이 강해서 하드코딩할 수 있으면 하드코딩해라

- 하드코딩한 짧은 버전 만들고 -> 일반화한 복잡한 문제 버전 만들어라

## 네 점에서 점 공유 안 하는 두 직선이 평행한지 확인하기

### 간단

```js
function solution(dots) {
    if (calculateSlope(dots[0], dots[1]) === calculateSlope(dots[2], dots[3])) return 1
    if (calculateSlope(dots[0], dots[2]) === calculateSlope(dots[1], dots[3])) return 1
    if (calculateSlope(dots[0], dots[3]) === calculateSlope(dots[1], dots[2])) return 1
    return 0
}

function calculateSlope(arr1, arr2) {
    return (arr2[1] - arr1[1]) / (arr2[0] - arr1[0])
}
```

### 복잡

```js
const splitDots = (dotArray) => {
    const firstDot = dotArray[0]
    const rest = dotArray.slice(1)

    const lineCombinationArray = rest.map((dot, index) => {
        const firstLine = [firstDot, dot]
        const secondLine = [...rest]
        secondLine.splice(index, 1)
        return [firstLine, secondLine]
    })

    return lineCombinationArray
}

const calcSlope = (dot1, dot2) => {
    return (dot2[1] - dot1[1]) / (dot2[0] - dot1[0])
}

const checkParallel = (lineCombination) => {
    return calcSlope(...lineCombination[0]) === calcSlope(...lineCombination[1])
}

const solution = (dotArray) => {
    const lineCombinationArray = splitDots(dotArray)
    const resultArray = lineCombinationArray.map((lineCombination) => checkParallel(lineCombination))

    return Number(resultArray.some((value) => value))
}
```
