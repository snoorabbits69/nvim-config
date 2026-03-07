return {
"rebelot/terminal.nvim",
config=function()
require("terminal").setup({
layout={open_cmd="botright new"}, -- for horizontal split
cmd={vim.o.shell},
autoclose=false,
})

--keymaps
local term=require("terminal.mappings")
 vim.keymap.set("n", "<leader>tt", term.toggle, { desc = "Toggle Terminal" })
    vim.keymap.set("n", "<leader>tr", term.run, { desc = "Run Command in Terminal" })
    vim.keymap.set("n", "<leader>tk", term.kill, { desc = "Kill Terminal" })
    vim.keymap.set("n", "<leader>tn", term.cycle_next, { desc = "Next Terminal" })
    vim.keymap.set("n", "<leader>tp", term.cycle_prev, { desc = "Prev Terminal" })

end



}
