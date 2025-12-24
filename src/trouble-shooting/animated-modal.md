# 모달에 애니메이션 넣으면 굉장히 까다로워짐

- 발생일: 2025-12-23
- 문제: 모달에 애니메이션 넣으면 굉장히 까다로워짐

## 문제 설명

### 구조상 모달과 안 어울림

#### 예시 코드

```tsx
<motion.div className="absolute inset-0">
    <AnimatePresence>
        <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            key={String(isOn)}
            style={{ backdropFilter: `blur(${isOn ? 4 : 0}px)` }}
            className="size-full"
        >
            {isOn && (
                <CenterContainer className="bg-fg-vivid/50 backdrop-blur-xs" onClick={onBackgroundClick}>
                    <Container width={width} isPadded>
                        {children}
                    </Container>
                </CenterContainer>
            )}
        </motion.div>
    </AnimatePresence>
</motion.div>
```

#### 위 구조에서의 문제

- isOn이 `AnimatePresence` 안에 있어야 애니메이션을 넣을 수 있는데
  그렇게 하려면 추가적인 `motion.div`가 밖에 있어야 함
- 그러나 그렇게 되면 얘가 항시 돔에 부착되어 있어야 함
- `if (!isOn) return null` 처럼 돔에서 뗄 수가 없음
- 클릭 이벤트를 얘가 다 먹음

### framer motion 페이지에서 모달이 있는 걸 보니 가능한 거 같기는 한데...

## 원인 파악:

## 해결:

## 소요 시간:

```

```
