# code example

```tsx
export const Route = createFileRoute("/route/url")({
    component: RouteComponent,
    validateSearch: z.object({
        code: z.string().optional(),
    }),
    beforeLoad: ({ search }) => {
        console.log({ search })
        debugger
        throw redirect({ to: "/" })
    },
})
```

# validateSearch

- takes object or fucntion
- using zod object is more concise

# beforeLoad vs loader

- loader: returns data, that can be used in useLoaderData
- beforeLoad: designed for guard, redirect

## summary of ai

| Aspect                | beforeLoad                                | loader                    |
| --------------------- | ----------------------------------------- | ------------------------- |
| Purpose               | Guards, redirects, setup                  | Data fetching             |
| Runs                  | First (before loader)                     | After beforeLoad          |
| Access to search      | ✅ Direct access                          | ❌ Via loaderDeps only    |
| Access to params      | ✅ Yes                                    | ✅ Yes                    |
| Access to context     | ✅ Yes                                    | ✅ Yes                    |
| Can modify context    | ✅ Yes (return value merges into context) | ❌ No                     |
| Return value          | Merges into context for children          | Becomes loaderData        |
| Throwing redirect()   | ✅ Common pattern                         | ✅ Possible               |
| Caching/Deduplication | ❌ No                                     | ✅ Yes (with React Query) |
| Preloading on hover   | ❌ No                                     | ✅ Yes                    |

## Execution Order

1. beforeLoad (parent routes first, top-down)
   ↓
2. loader (can run in parallel across routes)
   ↓
3. component renders

## When to Use Each

### Use beforeLoad for:

```tsx
beforeLoad: async ({ search, context }) => {
    // 1. Auth guards
    if (!context.auth.isLoggedIn) {
        throw redirect({ to: "/login" })
    }

    // 2. OAuth callback handling
    if (search.code) {
        await processOAuth(search.code)
        throw redirect({ to: "/" })
    }

    // 3. Adding to context for child routes
    return {
        user: await fetchUser(), // This merges into context
    }
}
```

### Use loader for:

```tsx
loaderDeps: ({ search }) => ({ page: search.page }),
loader: async ({ deps, context }) => {
// 1. Data fetching
const books = await fetchBooks(deps.page)

// 2. React Query integration
await context.queryClient.ensureQueryData(booksQueryOptions(deps.page))

return { books }
}
// In component:
const { books } = Route.useLoaderData()
```

## Key Differences Illustrated

### Context Modification (only beforeLoad)

```tsx
// Parent route
beforeLoad: async () => {
    return { user: await getUser() } // Adds to context
}
// Child route can access it
beforeLoad: ({ context }) => {
    console.log(context.user) // Available!
}
loader: ({ context }) => {
    console.log(context.user) // Also available here!
}
```

### Search Params Access

```tsx
// beforeLoad - direct access
beforeLoad: ({ search }) => {
console.log(search.code) // ✅ Works
}
// loader - must use loaderDeps
loaderDeps: ({ search }) => ({ code: search.code }),
loader: ({ deps }) => {
console.log(deps.code) // ✅ Works
}
loader: ({ search }) => {
console.log(search.code) // ❌ Error - search doesn't exist
}

```

## For Your OAuth Case

- beforeLoad is the right choice because:

1. You need search access → beforeLoad has it directly
2. You want to redirect → beforeLoad is designed for this
3. Side effects (store token) → beforeLoad runs before rendering
4. No data to return → loader returns data, you don't need that

```tsx
// Perfect for OAuth
beforeLoad: async ({ search }) => {
    await kakaoLogin(search.code)
    throw redirect({ to: "/" })
}
```
