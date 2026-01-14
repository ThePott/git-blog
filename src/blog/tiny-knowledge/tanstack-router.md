## config

`__root.tsx`를 만들고 개발 서버를 껐다 켜면 몇몇 파일들이 자동생성 된다

## `\*` vs `\_splat`

- 똑같다. `_splat`은 속성에 더 쉽게 접근하라고 있는 것이다

```tsx
const params = useParams()
const wildcard = params["*"]
const easy = params._splat
```
