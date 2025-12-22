## conditional object construction

### setup

```ts
interface FormValues {
    name?: string
    age?: number
}
```

### update only truthy value

```ts
await prismaClient.app_user.update({
    where: { id },
    data: {
        ...(name && { name }),
        ...(age && { age }),
    },
})
```
