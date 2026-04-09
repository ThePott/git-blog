# if unwrapped both null and error

## unwrapping null with if statement

```zig
const optional_value = someFunction();
if (optional_value) |unwrapped_value| {
// when value is valid
} else {
// when value is null
}
```

## unwrapping error with if statement

```zig
const possibly_error_value = anotherFunction();
if (possibly_error_value) |unwrapped_value| {
// when value is valid
// use `unwrapped_value` here
} else |error| {
// when value is error
// use `error` here
}
```
