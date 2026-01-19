/**
 * Generate all combinations of k elements from arr (nCk)
 *
 * Optimized for LeetCode:
 * - Simple 2-param signature for quick typing
 * - Push/pop instead of spread (faster, no new array allocation per iteration)
 * - Closure-based state (no need to pass path/result through recursion)
 * - Early pruning when remaining elements can't fulfill k
 *
 * Time Complexity: O(C(n,k) * k) - generating each combination and copying it
 * Space Complexity: O(k) for recursion depth + O(C(n,k) * k) for results
 *
 * @param {any[]} arr - source array
 * @param {number} k - number of elements to pick
 * @returns {any[][]} - array of combinations
 */
const combination = (arr, k) => {
    const result = []
    const current = []

    const backtrack = (start) => {
        // Pruning: not enough elements left to complete a combination
        // This avoids unnecessary recursion when it's impossible to reach k elements
        if (current.length + (arr.length - start) < k) return

        // Base case: we have exactly k elements, save this combination
        if (current.length === k) {
            result.push([...current]) // snapshot current path (must copy, path mutates)
            return
        }

        // Try each element from current position onwards
        // Starting from 'start' ensures we don't revisit earlier elements (no duplicates)
        for (let i = start; i < arr.length; i++) {
            current.push(arr[i]) // choose
            backtrack(i + 1) // explore
            current.pop() // un-choose (backtrack)
        }
    }

    backtrack(0)
    return result
}

// ============ Usage Examples ============

// Basic usage - returns array of arrays
const result = combination(["a", "b", "c", "d"], 3)
console.log("Raw combinations:", result)
// [["a","b","c"], ["a","b","d"], ["a","c","d"], ["b","c","d"]]

// If you need joined strings (like your makeSubResult):
const joined = result.map((combo) => combo.join(""))
console.log("Joined strings:", joined)
// ["abc", "abd", "acd", "bcd"]

// Works with numbers too (common in LeetCode)
const numResult = combination([1, 2, 3, 4, 5], 2)
console.log("Number pairs:", numResult)
// [[1,2], [1,3], [1,4], [1,5], [2,3], [2,4], [2,5], [3,4], [3,5], [4,5]]

// Sum of each combination
const sums = numResult.map((combo) => combo.reduce((a, b) => a + b, 0))
console.log("Sums:", sums)
// [3, 4, 5, 6, 5, 6, 7, 7, 8, 9]

module.exports = { combination }
