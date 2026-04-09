# How to build from source

## if the source contains `bin/`

- unzip and move to `/usr/local`

## if not (itself is just executable)

- unzip and move to `/usr/local/bin`

## when download

1. move to Desktop
2. `curl -L {download link to source} | tar -xJ `
    - `-L`: `--location`
    - `-x`: extract
    - `-J`: (c mode only) Compress the resulting archive with xz(1). In extract or list modes, this option is ignored.
      Note that this tar implementation recognizes XZ compression automatically when reading archives.
        - 이건 파일 확장자가 `tar.xz` 일 때 사용
3. move the extracted to the target directory
