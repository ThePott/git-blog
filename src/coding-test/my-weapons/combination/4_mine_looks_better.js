// TODO: combine letters of two, in alphabetic order

/**
 @param {Object} props
 @param {(newIngredientArray: string[]) => void} props.makeSubResult
 @param {string[]} props.targetArray
 @param {number} props.count
 @param {string[] | undefined} props.current
 @param {string[] | undefined} props.result
*/
const combination = ({ targetArray, count, current, result }) => {
    current = current ?? []
    result = result ?? []

    targetArray.forEach((el, index) => {
        console.count("recursive count")
        const rest = targetArray.slice(index + 1)

        const newCurrent = [...current, el]
        // NOTE: 여기에 걸리면 안 됨
        if (newCurrent.length > count) throw new Error("SHOULD NOT FALL HERE")

        // NOTE: 남은 개수가 부족하면 루프 끝냄
        if (newCurrent.length + rest.length < count) return

        // NOTE: 개수 딱 맞으면 합치고 해당 루프 끝냄
        if (newCurrent.length === count) {
            result.push(newCurrent)
            return
        }

        // NOTE: 아직 남았으면
        // NOTE: 재료에 넣고 마저 돌림
        combination({
            targetArray: rest,
            count,
            current: newCurrent,
            result,
        })
    })

    return result
}

const makeSubResult = (newIngredientArray) => newIngredientArray.join("")
const result = combination({ makeSubResult, targetArray: ["a", "b", "c", "d"], count: 3 })
console.log({ result })
