# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


# Set Up

git clone https://github.com/cryplo/nvim.git ~/.config/nvim


## C++ on macOS (Apple Silicon)

The clangd setup uses Homebrew GCC 16 to recognize GNU C++ headers such as
`bits/stdc++.h`. Install GCC and copy the clangd configuration to its macOS
user-config location:

```sh
brew install gcc
mkdir -p "$HOME/Library/Preferences/clangd"
cp "$HOME/.config/nvim/clangd/config.yaml" "$HOME/Library/Preferences/clangd/config.yaml"
```

Merge the file instead of replacing it if you already have a clangd user config.
Restart Neovim after setup. Compile programs with:

```sh
g++-16 -std=c++17 main.cpp -o main
./main
```

If Homebrew installs a different GCC major version, update the compiler path in
`clangd/config.yaml` and the query-driver path in `lua/plugins/lsp.lua`.
The clangd user config selects GCC headers for C++ files across projects.
