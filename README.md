# nvim

Minimal Neovim configuration. Fast, modular, no bloat.

## Structure

```
~/.config/nvim/
├── init.lua
└── lua/
    ├── config/
    └── plugins/
        ├── colors.lua
        ├── dashboard.lua
        ├── harpoon.lua
        ├── lsp.lua
        ├── nvimtree.lua
        ├── oildirectory.lua
        ├── oneliners.lua
        ├── telescope.lua
        ├── terminal.lua
        └── treesitter.lua
```

## How it works

Plugin management is handled by **[lazy.nvim](https://github.com/folke/lazy.nvim)**, which auto-installs on first launch.

Each plugin lives in its own file under `lua/plugins/` and returns a standard lazy.nvim spec:

```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup()
  end
}
```

lazy.nvim handles installation, updates, dependency resolution, and lazy loading automatically.

## Plugins

| Plugin | Purpose |
|---|---|
| lazy.nvim | Plugin manager |
| alpha-nvim | Start dashboard |
| nvim-lspconfig + mason | LSP setup |
| nvim-treesitter | Syntax highlighting |
| telescope.nvim | Fuzzy finder |
| nvim-tree / oil.nvim | File navigation |
| harpoon | Quick file switching |
| LuaSnip + cmp | Snippets & autocompletion |
| lualine.nvim | Status line |

## Install

```sh
git clone <repo-url> ~/.config/nvim
nvim  # lazy.nvim installs everything on first open
```

**Requirements:** Neovim 0.9+, Git
