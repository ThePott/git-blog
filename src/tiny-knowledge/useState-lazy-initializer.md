# useState lazy initializer

## 참고자료

- https://tkdodo.eu/blog/things-to-know-about-use-state#2-the-lazy-initializer

## useState 안에 함수 넣으면 마운트 될 때에만 초기화됨. 그냥 함수 호출 넣으면 cannot call impure function during render 라는 오류 출력됨
