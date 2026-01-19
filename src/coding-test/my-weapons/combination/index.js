// TODO: combine letters of two, in alphabetic order

/**
 @param {Object} props
 @param {(newIngredientArray: string[]) => void} props.makeSubResult
 @param {string[]} props.targetArray
 @param {number} props.count
 @param {string[] | undefined} props.ingredientArray
 @param {string[] | undefined} props.currentResult
*/
const combination = ({ makeSubResult, targetArray, count, ingredientArray, currentResult }) => {
    ingredientArray = ingredientArray ?? []
    currentResult = currentResult ?? []

    targetArray.forEach((el, index) => {
        const rest = targetArray.slice(index + 1)

        const newIngredientArray = [...ingredientArray, el]
        if (newIngredientArray.length > count) throw new Error("---- failed to stop look at time, INNER ERROR")

        // NOTE: 개수 딱 맞으면 합치고 해당 루프 끝냄
        if (newIngredientArray.length === count) {
            const subResult = makeSubResult(newIngredientArray)
            currentResult.push(subResult)
            return
        }

        // NOTE: 남은 개수가 부족하면 루프 끝냄
        if (newIngredientArray.length + rest.length < count) return

        // NOTE: 아직 남았으면
        // NOTE: 재료에 넣고 마저 돌림
        combination({ makeSubResult, targetArray: rest, count, ingredientArray: newIngredientArray, currentResult })
    })

    return currentResult
}

const makeSubResult = (newIngredientArray) => newIngredientArray.join("")
const result = combination({ makeSubResult, targetArray: ["a", "b", "c", "d"], count: 3 })
console.log({ result })
