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

1. try `tsc`

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

2. fix package json: package json -> target -> module

```
    "type": "commonJS", -> "module"
```

3. setup nodemon
4. fix module error (not lint yet)

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

5. fix eslint error

```zsh
npm init @eslint/config@latest
```

6. restart lsp and neovim
