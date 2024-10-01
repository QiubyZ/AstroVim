# AstroNvim Template

**NOTE:** This is for AstroNvim v4+
This is my AstroVim Configuration in Termux Android
A template for getting started with [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/QiubyZ/AstroVim.git ~/.config/nvim
```

#### Start Neovim

```shell
nvim
```

#### Installation Termux-Api for Copy text (yank text)

```bash
pkg install termux-api 

```

#### Installing lua-language-server 
We have to install the Lua language server which is available in the Termux repository.
then configure it into NVIM as a language server for lua-language-server

```bash
pkg in lua-language-server && \
ln -f -s "$(command -v lua-language-server)" /data/data/com.termux/files/home/.local/share/nvim/mason/packages/lua-language-server/libexec/bin/lua-language-server

```
but I've already handled this in Astrovim, so you just need to install the lua-language-server and cland Binary on pkg termux
Look code [astrolsp.lua](./lua/plugins/astrolsp.lua#L41-50) folder detail configuration.

