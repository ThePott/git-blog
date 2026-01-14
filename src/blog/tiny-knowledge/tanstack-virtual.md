# top vs translate-y for item positioning

The choice between transform: translateY() vs top positioning is about performance optimization.

## Why translateY() is used:

1. GPU Acceleration

```ts
transform: translateY(100px); /_ ✅ GPU accelerated _/
top: 100px; /_ ❌ CPU layout recalculation _/
```

2. No Layout Recalculation

• transform is a composite operation - happens after layout is done
• top triggers reflow - browser recalculates layout for entire page

3. Better Performance with Many Elements

• With 10,000 virtual items, transform keeps smooth 60fps
• top would cause janky scrolling as browser recalculates positions

## What happens if you use top:

```ts
// Using top instead of transform
style={{
  position: 'absolute',
  top: `${virtualRow.start}px`,  // ❌ Causes layout thrashing
  left: 0,
  width: '100%',
  height: `${virtualRow.size}px`,
  // No transform needed
}}

```

Problems:

1. Janky scrolling - Especially on mobile/low-end devices
2. Frame drops - Browser can't maintain 60fps during fast scrolling
3. CPU intensive - Forces layout recalculation for every position change

## Performance difference:

```css
/* Fast - Composite layer */
/* ~0.1ms per item */
transform: translateY(1000px);

/* Slow - Layout calculation */
/* ~1-5ms per item */
top: 1000px;
```

## Real-world impact:

• Small lists (< 100 items): Difference barely noticeable
• Large lists (1000+ items): transform is dramatically smoother
• Virtual scrolling: transform is essential for good UX

This is why all major virtualization libraries (React Window, TanStack Virtual, etc.) use transform - it's the only way to
achieve smooth scrolling performance with large datasets.
