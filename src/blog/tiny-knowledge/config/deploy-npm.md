# npm으로 타입스크립트 패키지 배포하기

## setup

1. create directory
2. tsc init
3. npm init
4. git init & .gitignore

## edit tsconfig.json to fix module error

1. set dist for build folder by uncommenting tsconfig.json
1. uncommnet node.js part in tsconfig.json

```
        // For nodejs:
        // "lib": ["esnext"],
```

2. fix package json: package json -> target -> module

```
    "type": "commonJS", -> "module"
```

## whitelist files

```json
{
    "files": ["dist", "README.md"]
}
```

## deploy

```zsh
npm login
npm publish
```

## update

```zsh
npm version patch
npm publish
npm view make-serializable version
```

## `prepublishOnly`

- publish 전에 할 것 돌림
- 관련 내용: https://docs.npmjs.com/cli/v11/using-npm/scripts

```json
<!-- package.json -->
{
    "script": {
        "prepublishOnly": "npm run build"
    }
}
```

## to make npx command

```json
{
    "bin": {
        "make-serializable": "dist/cli.js"
    },
    "files": ["dist", "README.md", "./src/script.ts"]
}
```

```ts
#!/usr/bin/env node

// NOTE: this is for interactive cli
async function main() {
    intro("add `make-serializable` in project")

    outro("You're all set!")
}

main().catch(console.error)
```
