# React Activity components (introduced in React 19.2)

## how to use

```tsx
<>
    {/* previously */}
    {isShowingSidebar && <Sidebar />}

    {/* with activity */}
    <Activity mode={isShowingSidebar ? "visible" : "hidden"}>
        <Sidebar />
    </Activity>
</>
```

## benefit

- preserve state
    - previously, it loses state when unmount
- selective hydration
    - mount hidden components with low priority
    - does not attach effect function

## suspense vs activity

- use suspense when fallback ui is needed
- use activity when fallback ui is not needed
- use suspense wrapping activity when
    - fallback ui is needed
    - multi-conditional activity (like tab change) is needed
