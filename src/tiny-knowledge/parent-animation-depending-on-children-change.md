## main source

- https://www.youtube.com/watch?v=G3OyF-lRAWo
- https://www.nan.fyi/magic-motion

## 1. setup

```tsx
const AnimationYoutubeTutorial = () => {
    const [isLong, setIsLong] = useState(false)
    return (
        <RoundBox isBordered padding="xl">
            <Vstack>
                <Button onClick={() => setIsLong(!isLong)}>toggle length</Button>
                <RoundBox color="bg2" padding="lg">
                    {isLong && (
                        <p>
                            asdfkl asDFFHJK alDFHJkasldHASjkdf ASDHJKf SAHDJKf HASDJKf HASJKlf ASHDjk ASdhf KLASJfH
                            KJASD asdfkjlas[ "(])asdhFKJASdfhASKJdllHASJKdf HASJKDLf HASJKDLf ASHJK ASKJLhASKJLHASKjld
                            HASHKJLD AS"]
                        </p>
                    )}
                    {!isLong && <p>short message</p>}
                </RoundBox>
            </Vstack>
        </RoundBox>
    )
}
```

## 2. what change is children, so wrap children with motion div

```tsx
<RoundBox isBordered padding="xl">
    <Vstack>
        <Button onClick={() => setIsLong(!isLong)}>toggle length</Button>
        <RoundBox color="bg2" padding="lg">
            <motion.div initial={{ height: 0 }} animate={{ height: "auto" }} key={Number(isLong)}>
                {isLong && (...)}
                {!isLong && (...)}
            </motion.div>
        </RoundBox>
    </Vstack>
</RoundBox>
```

### why needs changing key

- nothing in motion's prop is changed, so animation does not gets updated, even when the component itself updates by state change

## 3. check height and apply in animation

```tsx
const AnimationYoutubeTutorial = () => {
    const [isLong, setIsLong] = useState(false)
    const [ref, { height }] = useMeasure()
    return (
        <RoundBox isBordered padding="xl">
            <Vstack>
                <Button onClick={() => setIsLong(!isLong)}>toggle length</Button>
                <RoundBox color="bg2" padding="lg" className="overflow-hidden">
                    <motion.div animate={{ height }}>
                        <div ref={ref}>
                            {isLong && (
                                <p>
                                    asdfkl asDFFHJK alDFHJkasldHASjkdf ASDHJKf SAHDJKf HASDJKf HASJKlf ASHDjk ASdhf
                                    KLASJfH KJASD asdfkjlas[ "(])asdhFKJASdfhASKJdllHASJKdf HASJKDLf HASJKDLf ASHJK
                                    ASKJLhASKJLHASKjld HASHKJLD AS"]
                                </p>
                            )}
                            {!isLong && <p>short message</p>}
                        </div>
                    </motion.div>
                </RoundBox>
            </Vstack>
        </RoundBox>
    )
}
```

## 4. add animation for children

```tsx
// ...
                <div ref={ref}>
                    <AnimatePresence>
                        <motion.div
                            initial={{ opacity: 0 }}
                            animate={{ opacity: 1 }}
                            exit={{ opacity: 0 }}
                            key={Number(isLong)}
                        >
                            {isLong && (...)}
                            {!isLong && (...)}
                        </motion.div>
                    </AnimatePresence>
                </div>
// ...
```

### 위의 것이 된다는 건 알겠어. 그런데 왜 조건부 렌더링하는 것 자체를 motion.p로 하는 건 왜 안 되는 거야? - 고유 key를 빠뜨려서

#### 작동 안 함 - AnimatePresence의 자식은 고유 키를 가져야 하는데 얘는 그러지 않아서

```tsx
<AnimatePresence>
    {isLong && (
        <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
            {...}
        </motion.div>
    )}
    {!isLong && (
        <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }}>
            {...}
        </motion.div>
    )}
</AnimatePresence>
```

#### 작동함 - 고유 키 존재

```tsx
<AnimatePresence>
    {isLong && (
        <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} key="long">
            {...}
        </motion.div>
    )}
    {!isLong && (
        <motion.div initial={{ opacity: 0 }} animate={{ opacity: 1 }} exit={{ opacity: 0 }} key="short">
            {...}
        </motion.div>
    )}
</AnimatePresence>
```

## 5. structural change for applying absolute position

- height of box: handled by `<motion.div animate={{height}} />`
- content can be relative and have there space as long as relative parent is closest `<RoundBox/>` or its decendent
- absolute child must enter and exit by its purpose, so it must be decendent of exit motion containing `<motion.div />`

### new structure

- `<motion.div animate={{ height }}>`
    - `<AnimatePresence>`
        - `<motion.div exit={...} key={...} className="relative">` <- direct parent of absolute child
            - `<div ref={ref} className="absolute">` <- smallest div containing only changing children
                - `{condition && ...}`

### result

```tsx
<MotionConfig transition={{ duration: 1 }}>
    <RoundBox isBordered padding="xl">
        <Vstack>
            <Button onClick={() => setIsLong(!isLong)}>toggle length</Button>
            <RoundBox color="bg2" padding="lg" className="overflow-hidden">
                <motion.div animate={{ height }}>
                    <AnimatePresence>
                        <motion.div
                            initial={{ opacity: 0 }}
                            animate={{ opacity: 1 }}
                            exit={{ opacity: 0 }}
                            key={Number(isLong)}
                            className="relative"
                        >
                            <div ref={ref} className="absolute">
                                {isLong && (
                                    <p>
                                        asdfkl asDFFHJK alDFHJkasldHASjkdf ASDHJKf SAHDJKf HASDJKf HASJKlf ASHDjk ASdhf
                                        KLASJfH KJASD asdfkjlas[ "(])asdhFKJASdfhASKJdllHASJKdf HASJKDLf HASJKDLf ASHJK
                                        ASKJLhASKJLHASKjld HASHKJLD AS"]
                                    </p>
                                )}
                                {!isLong && <p>short message</p>}
                            </div>
                        </motion.div>
                    </AnimatePresence>
                </motion.div>
            </RoundBox>
        </Vstack>
    </RoundBox>
</MotionConfig>
```

## TIP: change layout simultaneously while exiting

- `<AnimatePresence mode="popLayout">`

### source

- https://motion.dev/docs/react-animate-presence
- readparagrage about "mode"
