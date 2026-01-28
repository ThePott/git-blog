# framer motion 사용법

- 움직이는 대상을 motion 컴포넌트로 만들면 된다. (그것의 부모는 평범해도 된다)
- 움직임을 추적하고 싶을 땐 `layout` prop을 사용한다. 추적하고 싶은 다른 형제가 있을 땐 `layoutId`를 사용한다
- controlled component를 만드느라 전달인자가 바뀔 때마다 키를 바꿔서 새로 마운트하지만 애니메이션은 연속적으로 사용하고
  싶을 땐 `layoutId`를 사용한다.

# case 1: 한 컴포넌트만 이리저리 움직임 (추가, 삭제 없음)

## reference:

# case 2: need exit animation

## reference: `ExpandableDiv`
