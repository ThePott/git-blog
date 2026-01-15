# controlled input with react hook form

## 배경

- submit 이후에 값을 없애고 싶음
- useState, onChange, value를 사용하니 react-hook-form이 값 변화를 제대로 감지하지 못함

## `{...register}`

1. register("classroom_name") returns { onChange, onBlur, name, ref } - these are react-hook-form's handlers
2. But you're overriding the onChange with your own onChange={(event) => setValue(event.target.value)}
3. And you're controlling the value with value={value} (your useState)

- So react-hook-form's onChange never gets called - it's being overwritten. The form only gets updated on onBlur (which still comes from register).

## submit 후에 값을 없애고 싶으면

- `reset` 사용
- `setValue` 사용
