return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,

      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
      },

      window = {
        width = 30,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem left<CR>", { desc = "Toggle Explorer" })
    vim.keymap.set("n", "<leader>b", ":Neotree toggle buffers right<CR>", { desc = "Buffers" })
    vim.keymap.set("n", "<leader>g", ":Neotree toggle git_status right<CR>", { desc = "Git Status" })
  end,
}
