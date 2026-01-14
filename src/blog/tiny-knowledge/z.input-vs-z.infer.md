# z.input vs z.infer

## 비교

- z.input: preprocess 전의 input에 감지되는 타입들
- z.infer: preprocess 끝난 타입

## 사용처

- z.input: `register`, `errors`
- z.infer: type of `data` in `handleSubmit` of `useForm`
