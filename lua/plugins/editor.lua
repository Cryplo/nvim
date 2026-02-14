-- Editor enhancements (file explorer, distraction-free writing, etc.)
return {
  -- Neo-tree (replaces NERDTree) - LazyVim includes this by default
  -- Configure it to match your NERDTree preferences
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "left", -- You had NERDTree on left in my_configs.vim
        width = 20,        -- Your NERDTreeWinSize was 20
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
    keys = {
      { "<leader>nf", "<cmd>Neotree reveal<cr>", desc = "Reveal file in explorer" },
    },
  },

  -- Goyo - Distraction-free writing
  {
    "junegunn/goyo.vim",
    cmd = "Goyo",
    keys = {
      { "<leader>z", "<cmd>Goyo<cr>", desc = "Toggle Goyo (zen mode)" },
    },
    init = function()
      vim.g.goyo_width = 100
      vim.g.goyo_height = "90%"
      vim.g.goyo_linenr = 1
    end,
    config = function()
      -- Restore line numbers when entering/leaving Goyo
      vim.api.nvim_create_autocmd("User", {
        pattern = "GoyoEnter",
        callback = function()
          vim.opt.number = true
          vim.opt.relativenumber = true
        end,
      })
      vim.api.nvim_create_autocmd("User", {
        pattern = "GoyoLeave",
        callback = function()
          vim.opt.number = true
          vim.opt.relativenumber = true
          -- Stop markdown preview if running
          if vim.fn.exists(":MarkdownPreviewStop") == 2 then
            vim.cmd("MarkdownPreviewStop")
          end
        end,
      })
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = "cd app && npm install",
    keys = {
      -- Combined Goyo + Markdown Preview toggle (your ,m mapping)
      {
        "<leader>m",
        function()
          vim.cmd("Goyo")
          vim.cmd("MarkdownPreviewToggle")
        end,
        desc = "Toggle Goyo + Markdown Preview",
      },
    },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },

  -- Disable mini.pairs and use nvim-autopairs instead
  { "mini.pairs", enabled = false },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },

  -- Telescope (LazyVim includes this, add your custom keymaps)
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
      -- MRU (Most Recently Used) - similar to your :MRU
      { "<leader>f", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
      -- Buffer explorer alternative
      { "<leader>o", "<cmd>Telescope buffers<cr>", desc = "Buffer explorer" },
    },
  },

  -- Surround (vim-surround equivalent)
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },

  -- Comment.nvim (vim-commentary equivalent) - LazyVim includes mini.comment
  -- No config needed, LazyVim handles this

  -- Git signs (gitgutter equivalent) - LazyVim includes this
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
}
