## basic syntax

```ts
const principalResult = await prismaClient.principal.findUnique({
    where: { user_id: id },
    select: { hagwon: { select: { name: true } } },
})
// NOTE: must be select -> table_name -> select
// NOTE: NOT select hagwon name
```

## include vs select

### select - Returns only the specified fields:

```ts
// Only returns hagwon data, no other principal fields
select: {
    hagwon: {
        select: {
            name: true
        }
    }
}
// Result: { hagwon: { name: "Some Hagwon" } }
```

### include - Returns all fields of the main model plus the specified relations:

```ts
// Returns all principal fields + hagwon data
include: {
    hagwon: {
        select: {
            name: true
        }
    }
}
// Result: { id: 1, user_id: 123, hagwon_id: 456, is_approved: true, hagwon: { name: "Some Hagwon" } }
```
