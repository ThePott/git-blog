# im-select로 한글 입력 후 -> esc -> 바로 영어 입력으로 전환

## 설치

```zsh
brew tap daipeihust/tap
brew install im-select
```

## 설정

```ts
local nvim_create_autocmd = vim.api.nvim_create_autocmd
nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.fn.system("im-select com.apple.keylayout.ABC")
	end,
})
```
