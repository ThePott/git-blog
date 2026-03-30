# base 64 encoder decoder

- 아스키 문자는 8비트, 64진법은 2\*\*6 개의 정보가 필요, 6비트가 한 글자.
- 8과 6의 최소공배수는 24, 따라서 64진법 인코더, 디코더는 24비트(3바이트) 단위로 끊어서 계산
- 해당 문자열이 끝날 땐 `=` 배치 (null terminator)
- 3바이트보다 문자열이 짧을 경우, 남는 뒷부분은 0으로 채워짐
- 0으로만 채워진 6비트는 자동으로 `=` 으로 변환됨

## 예시: `0` -> `MA==`

- in ASCII, `0` is `00110000`
- 0 is 1 byte. Base64 encodes 3 bytes at once. rest of bytes are filled with 0 (`00110000 00000000 00000000`)
- Base64's alphabet is 6 bits each, so split them with 6 bits unit ( `001100 000000 000000 000000`)

| 6-bit group | Decimal | Base64 char |
| ----------- | ------- | ----------- |
| 001100      | 12      | M           |
| 000000      | 0       | A           |
| 000000      | 0       | A           |
| 000000      | 0       | A           |

## Question: How does it tell this is `MA==` not `MAAA`?

- full padding 6-bit group converts to `=`
