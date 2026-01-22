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

        // NOTE: 이 부분 제대로 이해 못 했다
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
