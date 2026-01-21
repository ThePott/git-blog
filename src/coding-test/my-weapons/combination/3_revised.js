// TODO: combine letters of two, in alphabetic order

/**
 @param {Object} props
 @param {string[]} props.targetArray
 @param {number} props.count

 @returns {string[][]}  array of combination
*/
const combination = ({ targetArray, count }) => {
    const result = []

    // NOTE: result, current만 mutate 함
    const recursiveFn = ({ index, current }) => {
        console.count("recursive count")
        const element = targetArray[index]
        if (!element) throw new Error("SHOULD HAVE STOPPED BEFORE FALL HERE")

        const newCurrent = [...current, element]
        if (newCurrent.length > count) throw new Error("SHOULD NOT FALL HERE")

        // NOTE: 남은 걸 다 넣어도 부족하면 루프 끝냄
        if (newCurrent.length + targetArray.length - index - 1 < count) return

        // NOTE: 개수 딱 맞으면 합치고 해당 루프 끝냄
        if (newCurrent.length === count) {
            result.push(newCurrent)
            return
        }

        // NOTE: 아직 남았으면
        // NOTE: 재료에 넣고 마저 돌림
        for (let i = index + 1; i < targetArray.length; i++) {
            recursiveFn({ index: i, current: newCurrent })
        }
    }

    // NOTE: 아직 좀 덜 됐다...
    // NOTE: 이게 recursion function 안에 들어가는 게 맞아보이는데...
    targetArray.forEach((_, index) => recursiveFn({ index, current: [] }))

    return result
}

const result = combination({ targetArray: ["a", "b", "c", "d"], count: 3 })
console.log({ result })
