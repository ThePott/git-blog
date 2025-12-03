## tsconfig.app.json에 추가

```json
<!-- compilerOptions에 추가 -->

        /* Path mapping */
        "paths": {
            "@/*": [
                "./src/*"
            ]
        }
```

## vite.config.js에 추가

```js
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
```

```
<!-- defineConfig 객체 안에 추가 -->
    resolve: {
        alias: [{ find: "@", replacement: path.resolve(__dirname, "./src") }],
    },
```
