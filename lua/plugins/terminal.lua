return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      size = function(term)
        if term.direction == "horizontal" then return 15
        elseif term.direction == "vertical" then return vim.o.columns * 0.4
        end
      end,
      direction     = "horizontal",
      shell         = vim.o.shell,
      close_on_exit = false,
      autochdir     = true,
      shade_terminals = true,
      shading_factor  = 2,
      start_in_insert = true,
      persist_mode    = true,
    })

    -- ── Normal mode 
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>",                    { desc = "Toggle Terminal" })
    vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<cr>",                   { desc = "Terminal 1" })
    vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<cr>",                   { desc = "Terminal 2" })
    vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<cr>",                   { desc = "Terminal 3" })
    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Vertical Terminal" })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>",    { desc = "Float Terminal" })
    vim.keymap.set("n", "<leader>tr", function()
      vim.ui.input({ prompt = "Run: " }, function(cmd)
        if cmd and cmd ~= "" then
          vim.cmd("TermExec cmd='" .. cmd .. "'")
        end
      end)
    end, { desc = "Run Command in Terminal" })

    --Terminal
    vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>",      { desc = "Exit Terminal Mode" })
    vim.keymap.set("t", "<C-h>",      "<C-\\><C-n><C-w>h",{ desc = "Move Left" })
    vim.keymap.set("t", "<C-j>",      "<C-\\><C-n><C-w>j",{ desc = "Move Down" })
    vim.keymap.set("t", "<C-k>",      "<C-\\><C-n><C-w>k",{ desc = "Move Up" })
    vim.keymap.set("t", "<C-l>",      "<C-\\><C-n><C-w>l",{ desc = "Move Right" })
  end,
}
