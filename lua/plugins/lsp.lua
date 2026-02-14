-- LSP configuration
return {
  -- Mason - ensure your LSP servers are installed
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        -- Your LSP servers from my_configs.vim
        "pyright",
        "clangd",
        "typescript-language-server",
        "html-lsp",
        "css-lsp",
        "marksman",
        -- Linters/formatters
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "eslint-lsp",
      },
    },
  },

  -- LSP Config - add your servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- Python
        pyright = {},

        -- C/C++
        clangd = {},

        -- TypeScript/JavaScript
        ts_ls = {},

        -- HTML
        html = {},

        -- CSS
        cssls = {},

        -- Markdown
        marksman = {},

        -- OCaml (manually configured since it's opam-installed)
        ocamllsp = {
          cmd = { "/Users/dylanli/.opam/hazel/bin/ocamllsp" },
          filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
          mason = false, -- Don't try to install via Mason
        },
      },
      -- Custom setup for ocamllsp
      setup = {
        ocamllsp = function(_, opts)
          require("lspconfig").ocamllsp.setup(opts)
          return true -- Return true to skip default setup
        end,
      },
    },
  },

  -- Completion - customize key mappings (LazyVim uses nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- Your preferred key mappings
      opts.mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
      })

      return opts
    end,
  },
}
