# Instructions

Neovim expects its config files in `~/.config` directory.

```
cd ~/.config/
ln -s path/to/local/repo/OS-CM/nvim/nvim .
```

**NOTE:** If using a fresh install of Neovim, comment out the first line of `nvim/lua/plugins/telescope.lua` (the `pickers` line).
Then restart Neovim. This ensure the plugin is loaded first, and then configuration changes are made.

If an issue still persists, install the `fzf` package by performing `sudo apt install fzf`
