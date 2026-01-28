# `date-fns`로 1분 전, 1시간 전 등 표시하기

```ts
import { formatDistanceToNowStrict } from "date-fns"
import { ko } from "date-fns/locale"

const formatedString = formatDistanceToNowStrict(someDate, { addSuffix: true, locale: ko })
```
