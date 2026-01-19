// TODO: combine letters of two, in alphabetic order

// TODO: generalize element manipulation logic to callback

/**
 @param {string[]} targetArray
 @param {count} number
 @param {string[] | undefined} ingredientArray
 @param {string[] | undefined} currentResult
*/
const combination = (targetArray, count, ingredientArray, currentResult) => {
    ingredientArray = ingredientArray ?? []
    currentResult = currentResult ?? []

    targetArray.forEach((el, index) => {
        console.count("loop count")
        const rest = targetArray.slice(index + 1)

        // NOTE: 아직 남았으면
        // NOTE: 재료에 넣고 마저 돌림
        const newIngredientArray = [...ingredientArray, el]
        if (newIngredientArray.length > count) throw new Error("---- failed to stop look at time, INNER ERROR")
        if (newIngredientArray.length === count) {
            const subResult = newIngredientArray.join("")
            currentResult.push(subResult)
            return
        }
        combination(rest, count, newIngredientArray, currentResult)
    })

    return currentResult
}

const result = combination(["a", "b", "c", "d"], 4)
console.log({ result })
