# how to kill local servers

## background

- sometimes, local servers are running, but I don't know at where, making it hard to kill it

## commands

```zsh
<!-- find PID of 3030 port -->
lsof -i :3030

<!-- find all PID of local servers -->
lsof -i :3000=6000 | grep node | grep LISTEN

<!-- find all listening servers -->
 lsof -i | grep LISTEN
```
