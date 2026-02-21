-- Language-specific plugins and configurations
return {
  -- VimTeX for LaTeX editing
  {
    "lervag/vimtex",
    ft = { "tex", "latex" },
    init = function()
      -- Use Skim as PDF viewer
      vim.g.vimtex_view_method = "skim"

      -- Compiler settings (your latexmk options)
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-pdf",
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
    end,
  },

  -- Treesitter - extend with your languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Disable treesitter indentation (use vim's smartindent instead)
      opts.indent = { enable = false }
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "cpp",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "ocaml",
        "ocaml_interface",
        "python",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
        "latex",
      })
    end,
  },

  -- OCaml/Reason support
  {
    "reasonml-editor/vim-reason-plus",
    ft = { "reason", "ocaml" },
  },
}
