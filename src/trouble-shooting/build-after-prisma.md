## prisma 세팅 후 서버 빌드하면 에러 발생

- 발생일: 2025-11-28
- 문제: prisma 세팅 후 서버를 빌드하면 에러가 발생함
- 오류

```
error TS6059: File '/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/a
pi-of-arbor-the-tree/generated/prisma/browser.ts' is not under 'r
ootDir' '/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor
-the-tree/src'. 'rootDir' is expected to contain all source files
.
  The file is in the program because:
    Matched by default include pattern '**/*'
  File is ECMAScript module because '/Users/haheungju/Desktop/SRC
/DRAGON_WARRIOR/api-of-arbor-the-tree/package.json' has field "ty
pe" with value "module"
```

- 원인 파악:
    - tsconfig에서는 src를 rootDir로 설정해서 모든 게 다 src 안에 있어야 하는데 prisma 관련 폴더를은 그 밖에 있음
- 해결:
    - rootDir flag 삭제
    - package main 변경
- 소요 시간: 5분
