# 가운데 정렬을 하되 줄이 바뀌면 왼쪽 정렬하기

- text를 inline-block, text-left로 설정한다
- inline-block을 원하는 대로 배치한다 (text-center, text-left, text-right)

```tsx
<Component {...rest} className={clsx(titleVariants({ size, isMuted }), className)}>
    <p className="inline-block text-left">{children}</p>
</Component>
```
