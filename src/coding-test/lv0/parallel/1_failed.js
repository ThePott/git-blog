/**
 @param {object} props
 @param {any[]} props.targetArray
 @param {number} props.count  
 @param {any[]?} props.current
 @param {any[][]?} props.result
 */
const combination = ({ targetArray, count, current, result }) => {
    current = current ?? []
    result = result ?? []

    targetArray.forEach((element, index) => {
        const newCurrent = [...current, element]
        if (newCurrent.length === count) {
            result.push(newCurrent)
            return
        }

        const rest = targetArray.slice(index + 1)
        combination({ targetArray: rest, count, current: newCurrent, result })
    })

    return result
}

const calcSlope = (dot1, dot2) => {
    return (dot2[1] - dot1[1]) / (dot2[0] - dot1[0])
}

const checkParallel = (dotArray) => {
    const dotCombinationArray = combination({ targetArray: dotArray, count: 2 })
    const slopeArray = dotCombinationArray.map((dotCombination) => calcSlope(...dotCombination))
    const slopeSet = new Set(slopeArray)

    return Number(dotCombinationArray.length !== slopeSet.size)
}

const hasParallel = checkParallel([
    [3, 5],
    [4, 1],
    [2, 4],
    [5, 10],
])
console.log({ hasParallel })
