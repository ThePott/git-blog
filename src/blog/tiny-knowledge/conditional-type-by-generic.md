## change props type conditionally by other props type

### initial state

```ts
interface WithGridContainerProps {
    gap?: XsToXl | None
    isAutoFill?: boolean
    minColWidth: ...
}
```

### what I want

- isAutoFill === true -> minColWidth: XsToXl
- isAutoFill === false -> minColWidth: undefined

### cheat sheet

```ts
export type RecommendPageType = "recruit" | "lecture";

export type Recommended<T extends RecommendPageType> = T extends "recruit"
    ? Recruit
    : Lecture;

export interface RecommendPageProps<T extends RecommendPageType> {
    type: T;
    recommendedArray: Recommended<T>[];
}
```

### simplified

```ts
export type ConditionalType<T extends boolean> = T extends true
    ? XsToXl
    : undefined;

export interface Props<T extends boolean> {
    condition: T;
    somethingElse: ConditionalType<T>;
}
```
