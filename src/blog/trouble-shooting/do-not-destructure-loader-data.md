```
installHook.js:1 TypeError: Cannot destructure property 'assignedJoinedSyllabusArray' of 'useLoaderData(...)' as it is undefined.
    at SyllabusSidebarButtonMany (index.tsx?t=1773113661612:54:42)


The above error occurred in the <SyllabusSidebarButtonMany> component.

React will try to recreate this component tree from scratch using the error boundary you provided, CatchBoundaryImpl.
```

```tsx
const SyllabusSidebarButtonMany = ({ isDeletable }: SyllabusSidebarButtonManyProps) => {
    const { student_id, classroom_id } = commonSidebarRoute.useSearch()
    const { assignedJoinedSyllabusArray: loaderDataSyllabus, assignmentMetaInfoArray: loaderDataAssignment } =
        useLoaderData({ from: "/_sidebar/_assigned" })
    // ...
}
```
