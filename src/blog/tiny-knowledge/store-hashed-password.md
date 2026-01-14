## never store raw password, but hashed one

### high-level

- signup: client(raw password) -> server(hash it with 10 digit salt) -> db(store)
- login: client(raw email, password) -> server(fetch hashed password of matching email, extract salt, hash password from client, compare)

### code

```ts
// how to hash
await bcrypt.hash(password, 10)
// this generate random 10 digit hash

// how to compare hash results are the same when login
await bcrypt.compare(password, hash)
```

### characteristic of hash

- loses information: different output can results the same
    - cannot be reversed
- salt is public
- collision probability is near zero (practically impossible)
