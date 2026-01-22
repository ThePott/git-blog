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

const result = solution([
    [3, 5],
    [4, 1],
    [2, 4],
    [5, 10],
])
console.log({ result })
