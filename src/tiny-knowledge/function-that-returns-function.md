# 화살표가 연속으로 있다면 함수를 리턴한다는 뜻이다

```ts
// react-hook-form/dist/types/form.d.ts
export type UseFormHandleSubmit<TFieldValues extends FieldValues, TTransformedValues = TFieldValues> = (
    onValid: SubmitHandler<TTransformedValues>,
    onInvalid?: SubmitErrorHandler<TFieldValues>,
) => (e?: React.BaseSyntheticEvent) => Promise<void>
```
