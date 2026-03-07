return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header
    dashboard.section.header.val = {
      "⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢦⣬⣿⣿⣿",
      "⣵⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠃⠀⠀⠀⡐⣹⢋⣾⢻⣸⡀⠀⠀⣰⢀⡀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿",
      "⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠋⠈⠀⡼⠃⠀⠀⢰⡍⠈⠻⠀⠀⠀⠀⣀⣠⣀⡀⠘⣿",
      "⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣦⠹",
      "⡇⠀⡀⠀⠀⠀⠀⢠⠀⠀⠀⢀⡎⠀⠀⠀⠀⠀⣠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⢻⡷⠆⣿⣿⣿⣿⣿⣿⣿⡇",
      "⣧⣼⠀⠀⠀⠀⠀⣾⠀⠀⠀⣾⣇⠀⠀⠀⠀⣰⡏⠀⠀⠀⠀⠀⣠⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣄⠀⠘⢿⣿⣿⣿⣿⡟⣤",
      "⣿⣿⠀⢠⠀⠀⢠⣯⡀⠀⣰⣿⣿⠀⡄⠀⣼⣿⡇⠀⠀⠀⠀⣰⣿⡇⠀⡀⢰⡄⠀⠀⠀⠀⠀⠀⠀⠀⠐⣄⠋⡀⣾⠀⠉⠛⠉⠁⠀⣿",
      "⣿⣿⠀⠚⠀⠀⠸⣿⣧⢰⣬⡛⢿⣧⣧⣸⣿⣿⣧⠀⠀⠀⣴⣿⣿⡇⢠⣧⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠌⣠⣧⠁⠀⠀⠀⠀⠀⠀⣿",
      "⣿⣿⡄⡟⣿⠀⣆⢠⣀⠈⠭⣛⠦⡈⢻⣿⣿⣿⣿⡇⣤⣾⣿⣿⣿⡇⣾⣿⣿⡀⠀⠀⢠⠀⠀⠀⠀⠀⠀⢸⡿⠏⠀⠀⠀⠀⠀⠀⢰⣿",
      "⣿⣿⣷⣦⠻⡇⢹⣧⡹⠄⣦⡌⠑⢤⠀⢿⣿⣿⣿⣤⣤⣤⣤⣴⣶⣶⣶⣶⣶⣶⡆⢀⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿",
      "⣿⣿⣿⣿⣷⡌⠘⣿⣿⣦⣬⣥⣸⣼⡎⣬⣛⠛⡍⣭⣄⣀⣀⢀⣒⣂⡉⠉⠛⠿⠇⣾⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠏",
      "⣿⣿⣿⣿⣿⣇⡐⣦⣝⡻⢿⣿⣿⣿⠁⣰⣎⢻⣸⣿⣿⣯⣙⠈⠿⠿⠣⠾⣂⣤⠠⡍⡅⣠⣼⠀⠀⠀⡴⠛⢆⠀⠀⠀⠀⠀⣸⣿⠛⠻",
      "⣿⣿⣿⣿⣿⣿⡇⣿⣿⣿⣿⣶⣶⡶⢠⣿⣿⣧⣁⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡱⢛⣃⠋⠀⢀⠇⣀⣘⡄⣸⠀⠀⠀⠀⢠⣿⠟⠀⠀",
      "⣿⣿⣿⣿⣿⣿⣇⢹⣿⣿⣿⣿⣿⡀⢿⣿⣿⣿⣿⣷⣮⣝⡻⠿⠿⠿⠿⢟⣋⣤⣾⣿⣿⠀⢀⣾⠆⡀⣿⠏⠁⠀⠀⠀⣰⣿⣿⡄⠀⠀",
      "⣿⣿⣿⣿⣿⣿⣿⡘⣿⣿⣿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⣼⡃⠨⣲⠅⠀⠀⢀⠌⣱⠿⣿⣿⡿⡄⠀",
      "⣿⣿⣿⣿⣿⣿⣿⣷⡹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣴⠛⠿⠟⠁⠀⠀⢀⣾⠾⠁⠀⠹⣿⣷⡹⣆",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣷⡜⢿⣿⣿⣯⣙⣛⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⡁⠀⠀⠀⠀⠀⠀⡾⠿⠤⠄⠠⠀⠈⠿⠷⢘",
      "⣛⣻⣿⣿⣿⣟⣛⣻⣿⣿⣎⢿⣿⣿⣷⣭⣝⣲⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣱⣿⡇⢠⠀⠀⠀⡀⠰⢿⣿⢡⣤⣾⡿⠿⠿⢷⣿",
      "⣿⣿⣿⣿⣯⣭⣟⣛⣛⣻⡛⣧⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣫⣴⣿⣿⣿⣷⣼⡄⢠⠀⣀⣴⣦⠹⣴⣶⣶⣿⣿⣟⣻⣟",
      "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡘⣷⡙⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠁⢀⣾⣿⣿⣿⣿⣿⣿⡿⢛⣴⣾⣿⣿⣿⣷⣜⢿⣿⣿⡿⠿⠿⠿",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file",      ":ene <BAR> startinsert<CR>"),
      dashboard.button("f", "  Find file",     ":Telescope find_files<CR>"),
      dashboard.button("o", "  Open folder",   ":lua require('oil').open_float()<CR>"),
      dashboard.button("r", "  Recent files",  ":Telescope oldfiles<CR>"),
      dashboard.button("g", "  Find text",     ":Telescope live_grep<CR>"),
      dashboard.button("t", "  Open Terminal", ":terminal<CR>"),
      dashboard.button("c", "  Config",        ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "  Quit",          ":qa<CR>"),
    }

    -- Footer
    local function footer()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      return { "Loaded " .. stats.count .. " plugins in " .. ms .. " ms" }
    end

    dashboard.section.footer.val = footer()

    -- Highlight groups
    dashboard.section.header.opts.hl  = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl  = "AlphaFooter"

    vim.cmd([[
      highlight AlphaHeader  guifg=#7aa2f7
      highlight AlphaButtons guifg=#9ece6a
      highlight AlphaFooter  guifg=#f7768e
    ]])

    dashboard.section.buttons.opts.spacing = 1

    -- Center vertically; 38 = header(20) + gap(1) + buttons(8) + footer(1) + padding(8)
    local function top_pad()
      return math.max(0, math.floor((vim.fn.winheight(0) - 38) / 2))
    end

    dashboard.config.layout = {
      { type = "padding", val = top_pad() },
      dashboard.section.header,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    alpha.setup(dashboard.config)
  end,
}
