# prisma none filter

## source

- https://www.prisma.io/docs/orm/prisma-client/queries/relation-queries

## content

- Prisma Client provides the some, every, and none options to filter records by the properties of related records on the "-to-many" side of the relation. For example, filtering users based on properties of their posts.

### Requirement Query option to use

- `some`: "I want a list of every User that has at least one unpublished Post record" some posts are unpublished
- `none`: "I want a list of every User that has no unpublished Post records" none of the posts are unpublished
- `every`: "I want a list of every User that has only unpublished Post records" every post is unpublished

### code

- No posts with more than 100 views
- All posts have less than, or equal to 50 likes

```ts
const users = await prisma.user.findMany({
    where: {
        posts: {
            none: {
                views: {
                    gt: 100,
                },
            },
            every: {
                likes: {
                    lte: 50,
                },
            },
        },
    },
    include: {
        posts: true,
    },
})
```
