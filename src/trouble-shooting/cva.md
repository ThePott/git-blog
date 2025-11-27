## cva에서 varaints 설정이 왜 안 되지?

- 날짜: 2025-11-27
- 문제: 자꾸 undefined에다가 할당하려 한다는 오류만 뜸
- 오류

```
const fullScreenVariants = cva(`bg-gray-300`, {
    variants: {
        isCentered: "justify-center items-center",
    },
})
```

```
Diagnostics:
1. typescript: Argument of type '{ variants: { isCentered: string; }; }' is not assignable to parameter of type 'undefined'. [2345]
```

- 원인 파악: variants 객체의 구성이 잘못되었음
    - variant-name에 객체를 넣어야 하는데 string을 넣었음
    - 그런데 이게 왜 `undefined`에 넣는 걸로 인식이 된지는 모르겠음

```
variants: {
    "variant-name": {
        "variant-value-1": "style-of-this-condition",
        "variant-value-2": "style-of-that-condition",
    }
}
```

- 해결

```
const fullScreenVariants = cva(`bg-gray-300`, {
    variants: {
        isCentered: {
            true: "justify-center items-center",
            false: "",
        }
    },
})
```

- 소요 시간: 20분
