# My NvChad config

## Installation process

[Documentation](https://nvchad.com/docs/quickstart/install)

**Requirements:**

- [Neovim 0.9](https://github.com/neovim/neovim/releases/tag/v0.9.0)
- [NerdFonts](https://www.nerdfonts.com/)
- [Ripgrep](https://github.com/BurntSushi/ripgrep) -- (Optional)

### Pre install

1. Backup your nvim configurations:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

## Installation

`git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim`

Don't apply auto_config generation prompt.

## Post Install

- Go to `nvim/lua` config directory: `cd ~/.config/nvim/lua`;
- Create cutom directory: `mkdir custom && cd $_`;
- Clone this repo;
- Check out lspconfig server
  [configurations](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md);
