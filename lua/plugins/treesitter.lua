return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,  -- plugin explicitly does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    -- Install parsers for our languages
    require("nvim-treesitter").install({ "go", "typescript", "tsx", "rust" })

    -- Highlighting (handled by Neovim itself, enabled per filetype)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "typescript", "typescriptreact", "rust" },
      callback = function() vim.treesitter.start() end,
    })

    -- Indentation (experimental) per filetype
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "go", "typescript", "typescriptreact", "rust" },
      callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
