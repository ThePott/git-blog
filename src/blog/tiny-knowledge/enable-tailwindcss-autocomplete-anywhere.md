# 원하는 곳 어디에서는 TailwindCSS 자동 완성 활성화하기

## neovim config

```lua
vim.lsp.config.tailwindcss = {
	settings = {
		tailwindCSS = {
			experimental = {
				classRegex = {
					{ "clsx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
					{ "tv\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
					{ "Record<[\\w\\s|,]+,\\s*TailwindCSS>\\s*=\\s*\\{([\\s\\S]*?)\\}", "[\"'`]([^\"'`]*).*?[\"'`]" },
				},
			},
		},
	},
}
```

## regex breakdown

- `\\(`: literal `(`, lua uses `\` for escaping, so to `\(`, you need `\\(`
- `()`: grouping logic
- `[]`: characters
- `\\w`: any word character (`[a-zA-Z0-9_]`)
- `\\S`: non-whitespace (including special characters)
- `\\s`: whitespace
- `+`: one or more
- `*`: zero or more

## bridge of first and second regex

- `([^)]*)`
- `([\\s\\S]*?)`
