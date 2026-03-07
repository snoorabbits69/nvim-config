return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    -- Autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    -- Snippets
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    -- Setup Mason for managing LSP servers
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "gopls", "rust_analyzer", "lua_ls", "pyright" }
    })

    -- Setup nvim-cmp for autocompletion
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
      mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      -- Show inline autosuggestion as you type
      experimental = {
        ghost_text = true,
      },
    })

    -- Apply shared capabilities and keymaps to all LSP servers
    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    -- Shared keymaps for all LSP servers
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { noremap = true, silent = true, buffer = event.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
      end
    })

    -- Lua LSP
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        }
      }
    })

    -- Go LSP
    vim.lsp.config("gopls", {
      settings = {
        gopls = {
          analyses = { unusedparams = true, unreachable = true },
          staticcheck = true,
        }
      }
    })

    -- Enable all configured servers
    vim.lsp.enable({ "lua_ls", "gopls", "rust_analyzer", "pyright" })

    -- Autoformat Go files on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        if #vim.lsp.get_clients({ bufnr = 0, method = "textDocument/formatting" }) > 0 then
          vim.lsp.buf.format({ async = false })
        end
      end
    })
  end
}
