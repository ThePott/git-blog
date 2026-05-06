# lock vs atomic value

## use atomic value for primitive

- integer, bool, pointer, etc

## use mutex for all or nothing case

- mutate multiple fields at once

## use rwlock for many readers one writer
