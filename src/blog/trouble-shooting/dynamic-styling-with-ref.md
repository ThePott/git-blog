## ref를 이용한 동적 스타일링이 린트에서 경고 받음

- 발생일: 2025-o2-02
- 문제:
    - 기존 방식: 드롭다운을 만들며 트리거 ref의 width, height 을 바탕으로 드롭다운 콘텐트의 위치를 정했음 - 기존 코드

    ```tsx
    const DropdownContent = (...) => {
    // ...
    if (!triggerRef.current) {
    return null
    }

      const style = {
      top: triggerRef.current.offsetHeight + 4,
      right: 0,
      }

      return ...
      }
    ```

    - 린트 오류 발생

- 오류

```
Diagnostics:
1. eslint_d: Error: Cannot access refs during render

   React refs are values that are not needed for rendering. Refs should only be accessed outside of render, such as in event
handlers or effects. Accessing a ref value (the `current` property) during render can cause your component not to update as
expected (https://react.dev/reference/react/useRef).

   /Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/arbor-the-tree/src/packages/components/Dropdown/_DropdownContent.tsx:48:10
     46 |     }
     47 |
   > 48 |     if (!triggerRef.current) {
        |          ^^^^^^^^^^^^^^^^^^ Cannot access ref value during render
     49 |         return null
     50 |     }
     51 |

   To initialize a ref only once, check that the ref is null with the pattern `if (ref.current == null) { ref.current = ... }`
[react-hooks/refs]
```

- 원인 파악:
    - 더 엄격한 린트: `npm create vite@latest`, eslint 초기화를 통해 린트가 이전보다 더 엄격해짐
    - 렌더 중 ref에 접근하는 패턴이 안티 패턴이 됨
        - ref: 마운트 이후에 값이 정해짐
        - ref의 변화는 리액트가 감지하지 못함
        - 렌더 중 ref 접근은 안정적이지가 않음(not reliable)
- 해결:
    - css를 원한다면 css로 해결
    - `"absolute z-10 top-full right-0 mt-my-sm"`
    - `top-full`로 간단히 해결함
- 소요 시간: 30분
