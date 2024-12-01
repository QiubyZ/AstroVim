# AstroNvim Template

**NOTE:** This is for AstroNvim v4+
This is my AstroVim Configuration in Termux Android
A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```


#### Installation 
```bash
yes | pkg update && pkg upgrade
```

```bash
yes | pkg in x11-repo neovim termux-api build-essential lua53 lua-language-server clang zig luarocks python golang
```

### Clone the repository

```shell
git clone https://github.com/QiubyZ/AstroVim.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```
