# TanStack Router를 bun bundler와 함께 사용할 시 `bunx tsc ...` 가 작동하지 않는 문제

- 발생 시각: 2026-03-17
- 문제: `bun init --react` 후 tanstack router를 설치했는데 `tsr generate`을 할 수가 없음
- 해결 시각:

## 배경

- bun react 프로젝트에서 tanstack router를 사용하려고 함
- bun bundler는 tanstack router에서 지원되는 번들러가 아니기에 아래 매뉴얼을 따라 설정함
    > https://tanstack.com/router/v1/docs/installation/with-router-cli#ignoring-the-generated-route-tree-file
- 하지만 `bunx tsr generate`, `bunx tsr watch` 모두 바로 종료될 뿐 아무것도 하지 않음

## 분석

### 시도 1: `./node_modules/@tanstack/router-cli/src/index.ts`에 로그 추가

- 실제 모듈로서 기능하는 건 ts 파일이 아니라 `./node_modules/@tanstack/router-cli/dist/cjs/index.cjs`임

### 시도 2: `./node_modules/@tanstack/router-cli/dist/cjs/index.cjs`에 로그 추가 -> 빈 argv 확인

```ts
async function main() {
    console.log("=== CLI STARTING ===")
    console.log("process.argv:", process.argv)
    // NOTE: process.argv: [
    // '/Users/haheungju/.nvm/versions/node/v22.17.0/bin/node',
    // '/Users/haheungju/Desktop/SRC/DRAGON_WARRIOR/MY_NPM/iua-react-ui/node_modules/.bin/tsr',
    // 'watch'
    // ]
    console.log("process.argv.slice(2):", process.argv.slice(2))

    const yargsInstance = (0, yargs.default)(process.argv.slice(2))
    console.log("1. yargs instance created")

    yargsInstance.scriptName("tsr")
    console.log("2. scriptName set")

    yargsInstance.usage("$0 <cmd> [args]")
    console.log("3. usage set")

    yargsInstance.command("generate", "Generate the routes for a project", async () => {
        console.log("=== GENERATE HANDLER CALLED ===")
        const config = (0, _tanstack_router_generator.getConfig)()
        console.log("4a. config:", JSON.stringify(config, null, 2))
        await require_generate.generate(config, process.cwd())
        console.log("4b. generate completed")
    })
    console.log("4. generate command registered")

    yargsInstance.command("watch", "Continuously watch and generate the routes for a project", () => {
        console.log("=== WATCH HANDLER CALLED ===")
        require_watch.watch(process.cwd())
    })
    console.log("5. watch command registered")

    yargsInstance.help()
    console.log("6. help registered")

    console.log("7. about to call parse()...")
    const result = await yargsInstance.argv
    console.log("8. parse result:", result) // NOTE: result: { _: [], '$0': 'tsr' }{ _: [], '$0': 'tsr' }

    console.log("=== CLI FINISHED ===")
}
```

- 이후 `bunx tsr watch` `bunx tsr generate`이 정상 작동함을 확인

### 해결책

1. fork -> clone -> `yargs`의 전달인자로 `process.argv.slice(2)` 넣음
2. commit -> push -> pull request
3. CodeRabbit bot의 요구사항에 따라 `changeset` 작성
4. 현재 병합 대기중
    > https://github.com/TanStack/router/pull/6941
