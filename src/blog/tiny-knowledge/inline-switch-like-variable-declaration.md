# 여러 조건에 따라 변수 값을 다르게 선언하는 법

## 최초 발상: inline switch를 사용하면 좋지 않을까?

```ts
// NOTE: this is NOT correct syntax
// NOTE: this is what I IMAGINE
const format = (contentType) => {
    switch(contentType) {
        case "file": return "raw"
        case "dir": return "json"
    }
}()
```

## better solutions

### correct syntax of IIFE(Immedite Invoked Function Expression, 즉시 함수 실행식)

```ts
const format = ((ct: ContentType) => {
    switch (ct) {
        case "file":
            return "raw"
        case "dir":
            return "json"
    }
})(contentType)
```

### object lookup <- RECOMMENDED

```ts
const format = { file: "raw", dir: "json" }[contentType]
```
