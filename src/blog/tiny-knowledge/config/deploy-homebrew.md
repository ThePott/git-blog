# deploy through homebrew

## manual

### create tap

- https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap

## prerequisite

### tag your deploying repo

```bash
git tag v0.1.0
git push origin v0.1.0
```

## create new tap and push it

### manual

```bash
brew tap-new $CODEBERG_USERNAME/homebrew-tap
cd $(brew --repository $CODEBERG_USERNAME/homebrew-tap)
# do not need this
sudo rm -fr ./.github
cb-create
```

### uasage

```bash
brew tap-new thepott/homebrew-tap && \
cd $(brew --repository thepott/homebrew-tap) && \
sudo rm -fr ./.github
cb-create
```

## create ruby formula

### manual

```bash
brew create --zig $(TAR_GX_URL) \
--tap $CODEBERG_NAME/homebrew-tap \
--set-name $(APP-NAME)
```

### uasage

```bash
brew create --zig https://codeberg.org/ThePott/zig-keyboard-warrior-raylib/archive/v0.1.0.tar.gz \
--tap thepott/homebrew-tap \
--set-name keyboard-warrior && \

```

## validate formula

```bash
# run one by one
HOMEBREW_NO_INSTALL_FROM_API=1 brew audit --new keyboard-warrior
HOMEBREW_NO_INSTALL_FROM_API=1 brew install --build-from-source --verbose --debug keyboard-warrior
HOMEBREW_NO_INSTALL_FROM_API=1 brew test keyboard-warrior
```

## install through brew

```bash
brew tap thepott/tap https://codeberg.org/thepott/homebrew-tap.git
brew install keyboard-warrior
```

## install wity pre-built binary

```bash
# need to add curl command
```

## build from source

```bash
git clone https://codeberg.org/ThePott/zig-keyboard-warrior-raylib.git
cd zig-keyboard-warrior-raylib
zig build
sudo cp ./zig-out/bin/keyboard-warrior /usr/local/bin/
```

# shell script for post push
