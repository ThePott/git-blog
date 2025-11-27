## box-shadow syntax

```css
box-shadow:
    0 10px 15px -3px rgb(0 0 0 / 0.1),
    0 4px 6px -4px rgb(0 0 0 / 0.1);
```

```css
/* <offset-x> | <offset-y> | <blur-radius> | <spread-radius> | <color> */
box-shadow: 2px 2px 2px 1px rgb(0 0 0 / 20%);
```

### blur-radius vs spread-radius

- blur-radius: how strong the blur is
    - big: soft
    - small: hard
- spread-radius: how big the total blur is
    - positive: bigger than box
    - negative: smaller than box
