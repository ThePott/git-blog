# `$.tsx` vs `$something`

## `$.tsx`: splat

- catch-all

### example

- if url is: http://localhost:5173/src/what-to-do
- \_splat is `src/what-to-do`

## `$something.tsx`: param

- dynamic segment
- only single part

### example

- if url is: http://localhost:5173/src/what-to-do
- you will fall to `notFoundComponent`
