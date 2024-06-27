return {
  { "akinsho/bufferline.nvim", enabled = false },

  {
    "mickael-menu/zk-nvim",
    config = function()
      require("zk").setup({
        picker = "telescope",

        lsp = {
          config = {
            cmd = { "zk", "lsp" },
            name = "zk",
            -- on_attach = ...
            -- etc, see `:h vim.lsp.start_client()`
          },

          -- automatically attach buffers in a zk notebook that match the given filetypes
          auto_attach = {
            enabled = true,
            filetypes = { "markdown" },
          },
        },
      })
    end,
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        -- "query",
        -- "regex",
        "vim",
        "python",
        "css",
        -- "sql",
      },
      auto_install = true,
      additional_vim_regex_highlighting = false,
    },
  },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "bashls",
        -- "cssls",
        -- "cssmodules_ls",
        -- "flake8",
        -- "html",
        -- "markuplint",
        -- "pyre",
        -- "shfmt",
        -- "sqlfluff",
        -- "sqlls",
        -- "vimls",
        "autoflake",
        "autopep8",
        "beautysh",
        "biome",
        "cbfmt",
        "emmet-ls",
        "prettierd",
        "pyright",
        "semgrep",
        "shellcheck",
        "shellcheck",
        "shellharden",
        "stylelint",
        "stylua",
        "vint",
        "vulture",
        "zk",
      },
    },
  },
  {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup({
        terminals = {
          shell = vim.o.shell,
          list = {},
          type_opts = {
            float = {
              relative = "editor",
              row = 0.3,
              col = 0.25,
              width = 0.5,
              height = 0.4,
              border = "single",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.5 },
          },
        },
        behavior = {
          autoclose_on_quit = {
            enabled = false,
            confirm = true,
          },
          close_on_exit = true,
          auto_insert = true,
        },
      })
    end,
    keys = {
      {
        "<leader>th",
        function()
          require("nvterm.terminal").toggle("horizontal")
        end,
        desc = "Open horizontal nvterm",
      },
      {
        "<leader>tv",
        function()
          require("nvterm.terminal").toggle("vertical")
        end,
        desc = "Open vertical nvterm",
      },
    },
  },
  { "fladson/vim-kitty" },
  -- { "David-Kunz/gen.nvim", dev = true },
  -- { "brenoprata10/nvim-highlight-colors" },
  -- {
  --   "dreamsofcode-io/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function()
  --     require("chatgpt").setup({
  --       async_api_key_cmd = "pass show chatgpt",
  --     })
  --   end,
  -- },
}
