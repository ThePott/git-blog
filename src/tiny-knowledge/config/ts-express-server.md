## basic setup

1. create directory
2. tsc init
3. npm init

```
Diagnostics:
1. eslint_d: Could not parse linter output due to: Expected value but found invalid token at character 1
   output: Error: Could not find config file.
```

## ignore all and run express server

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

3. fix package json: package json -> target -> module

```
    "type": "commonJS", -> "module"
```

4. install tsx in dev dep and set it up
5. fix module error (not lint yet)

```
Diagnostics:
1. typescript: ESM syntax is not allowed in a CommonJS module when 'verbatimModuleSyntax' is enabled. [1286]
2. eslint_d: Could not parse linter output due to: Expected value but found invalid token at character 1
   output: Error: Could not find config file.
```

- uncommnet node.js part in tsconfig.json

```
        // For nodejs:
        // "lib": ["esnext"],
        // "types": ["node"],
        // and npm install -D @types/node
```

7. fix eslint error

```zsh
npm init @eslint/config@latest
```

8. restart lsp and neovim
