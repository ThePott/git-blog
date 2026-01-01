# data-something, aira-something으로 값을 저장한 후 그걸로 quesrySelect를 한다

```tsx
export default function App() {
  const form = useForm({
    onSubmitInvalid: () => {
      const InvalidInput = document.querySelector(
        '[aria-invalid="true"]',
      ) as HTMLInputElement

      InvalidInput?.focus()
    },
  })

  return (
    <form
      onSubmit={...}
    >
      <form.Field
        children={(field) => (
            <input
              {...}
              aria-invalid={
                !field.state.meta.isValid && field.state.meta.isTouched
              }
            />
        )}
      />
    </form>
  )
}
```
