# 함수 전달인자는 let 변수이므로 재할당이 가능하다

This is actually a JavaScript/TypeScript quirk that many developers don't realize.
The key insight: Function parameters are NOT const - they're let variables in disguise.

## What's happening:

```ts
const func = (param) => {
    param = "new value" // ✅ This works! param is actually 'let', not 'const'
    // param is like: let param = argumentValue
}
```

## Function parameters are equivalent to:

```ts
const func = (argumentValue) => {
    let param = argumentValue // This is what actually happens
    param = "new value" // Now you can reassign
}
```

## Your function works because:

```ts
export const makeNewOverlayingRowArray = (
previousOverlayingValue: string | null, // This is like 'let previousOverlayingValue = ...'
// ... other params
) => {
// You can reassign it!
previousOverlayingValue = newValue ✅
}
```

## Common misconception:

• Many think params are const because of destructuring: const { a, b } = props
• But function parameters themselves are always mutable (like let)

If you want true immutability, you'd need:

```ts
const func = (param) => {
    const immutableParam = param // Now you can't change immutableParam
}
```

So yes, your refactored function works perfectly because function parameters are inherently reassignable!
Plan claude-sonnet-4-20250514 (08:06 PM)
