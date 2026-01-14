# express 서버에서 cookie-parser 사용법

## config

- 미들웨어 장착해야 함
- cross origin 허용해야 함
    - cors
    - cookie options
    - client axios

### express config

#### CorsOptions: `credentials: true`

```ts
// CorsOptions 수정
app.use(
    cors({
        origin: "http://localhost:3000", // Your React app's origin
        credentials: true, // Allow the browser to send/receive cookies
    }),
)
```

#### `app.use(cookieParser)`

- 미들웨어 장착

```ts
// NOTE: 이걸 적용하고 나면 아래의 `.cookie`에 접근이 가능해짐 (안 하면 `undefined`)
// NOTE: route 보다 위에서 적용되어야 함
app.use(cookieParser)
```

#### cookie options

```ts
export const REFRESH_TOKEN_COOKIE_OPTIONS: CookieOptions = {
    httpOnly: true, // NOTE: caanot access cookie with javascript
    secure: true, // NOTE: https only allowed, but localhost is okay
    maxAge: REFRESH_TOKEN_AGE,
    sameSite: "none", // NOTE: cross orgin allowed (api, client have different domains)
} as const
```

### react axios config

```ts
axios.defaults.withCredentials = true
```

## 미들웨어 적용하고 나면 할 수 있는 것

### READ: req에서 refresh 토큰 확인할 때

```ts
const token = req.cookies.name_of_token
```

### WRITE: res로 새 리프레시 토큰 넣을 때

```ts
const options = {
    httpOnly: true, // Makes the cookie inaccessible to client-side JavaScript
    secure: process.env.NODE_ENV === "production", // Only send over HTTPS in production
    maxAge: 1000 * 60 * 60 * 24, // Cookie valid for 1 day (in milliseconds)
    sameSite: "Strict", // Helps prevent CSRF attacks
}

// Set the cookie named 'sessionToken' with a value and the defined options
res.cookie("name_of_token", "your-secret-token-value", options)
```

### DELETE: logout하면 쿠키에서 토큰 삭제

```ts
res.clearCookie("name_of_token")
```
