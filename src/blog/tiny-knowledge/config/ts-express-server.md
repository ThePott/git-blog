## basic setup

1. create directory
2. tsc init
3. npm init
4. install express, dotenv, cors

## edit tsconfig.json to fix module error

1. set dist for build folder by uncommenting tsconfig.json
1. uncommnet node.js part in tsconfig.json

```
        // For nodejs:
        // "lib": ["esnext"],
        // "types": ["node"],
        // and npm install -D @types/node
```

2. fix package json: package json -> target -> module

```
    "type": "commonJS", -> "module"
```

- this will help to resolve following

```
Diagnostics:
1. typescript: ESM syntax is not allowed in a CommonJS module when 'verbatimModuleSyntax' is enabled. [1286]
2. eslint_d: Could not parse linter output due to: Expected value but found invalid token at character 1
   output: Error: Could not find config file.
```

## ignore all and run express server

- ignore following error and just run server

```
Diagnostics:
1. eslint_d: Could not parse linter output due to: Expected value but found invalid token at character 1
   output: Error: Could not find config file.
```

1. setup port using env

```ts
const port = process.env.PORT || 3000
```

2. try `tsc`

```
❯ tsc
src/server.ts:1:8 - error TS1295: ECMAScript imports and exports
cannot be written in a CommonJS file under 'verbatimModuleSyntax'
. Adjust the 'type' field in the nearest 'package.json' to make t
his file an ECMAScript module, or adjust your 'verbatimModuleSynt
ax', 'module', and 'moduleResolution' settings in TypeScript.

1 import express from "express";
         ~~~~~~~


Found 1 error in src/server.ts:1
```

4. install tsx in dev dep and set it up to watch server file

## fix lint error

1. install eslint in dev dep

2. config eslint

```zsh
npm init @eslint/config@latest
```

8. restart lsp and neovim

## package.json

```json
{
    "dev": "tsx --watch ./src/server.ts",
    "build": "npx prisma generate && tsc"
}
```
