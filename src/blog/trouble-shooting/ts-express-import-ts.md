## importing file from ts express project

- 발생일: 2025-11-28
- 문제: `.js`로 임포트하면 nodemon이 에러를 뱉고, `.ts`로 하면 eslint가 에러를 띄움
- 오류

```
Error: Cannot find module '/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/routers/checkHealthRouter.js' imported from /Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/server.ts
    at finalizeResolution (node:internal/modules/esm/resolve:274:11)
    at moduleResolve (node:internal/modules/esm/resolve:864:10)
    at defaultResolve (node:internal/modules/esm/resolve:990:11)
    at ModuleLoader.#cachedDefaultResolve (node:internal/modules/esm/loader:768:20)
    at ModuleLoader.resolve (node:internal/modules/esm/loader:745:38)
    at ModuleLoader.getModuleJobForImport (node:internal/modules/esm/loader:318:38)
    at ModuleJob.#link (node:internal/modules/esm/module_job:208:49) {
  code: 'ERR_MODULE_NOT_FOUND',
  url: 'file:///Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/routers/checkHealthRouter.js'
}
[nodemon] app crashed - waiting for file changes before starting...
```

```
Diagnostics:
1. typescript: An import path can only end with a '.ts' extension when 'allowImportingTsExtensions' is enabled. [5097]
```

- 원인 파악:
    - 기존 명령어: `"dev": "nodemon ./src/server.ts",`
    - 글로벌로 ts-node가 깔려 있어서 그냥 실행해도 됐음
    - 사실 정확한 원인은 모르겠네
- 해결: nodemon -> tsx watch
- 소요 시간: 20분

## setup router

1. make router file and import -> error

```
Error: Cannot find module '/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/routers/checkHealthRouter.js' imported from /Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/server.ts
    at finalizeResolution (node:internal/modules/esm/resolve:274:11)
    at moduleResolve (node:internal/modules/esm/resolve:864:10)
    at defaultResolve (node:internal/modules/esm/resolve:990:11)
    at ModuleLoader.#cachedDefaultResolve (node:internal/modules/esm/loader:768:20)
    at ModuleLoader.resolve (node:internal/modules/esm/loader:745:38)
    at ModuleLoader.getModuleJobForImport (node:internal/modules/esm/loader:318:38)
    at ModuleJob.#link (node:internal/modules/esm/module_job:208:49) {
  code: 'ERR_MODULE_NOT_FOUND',
  url: 'file:///Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/api-of-arbor-the-tree/src/routers/checkHealthRouter.js'
}
[nodemon] app crashed - waiting for file changes before starting...
```

fixed by replacing nodemon with tsx watch
