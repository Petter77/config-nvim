return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate", -- automatyczna aktualizacja parserów
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Włączone parsery
      ensure_installed = {
        "lua", "vim", "bash", "html", "css", "javascript", "typescript",
        "tsx", "json", "markdown", "markdown_inline", "python", "go"
      },

      -- Instalowanie parserów synchronizacyjnie (wolniejsze)
      sync_install = false,

      -- Automatyczna instalacja brakujących parserów przy otwieraniu plików
      auto_install = true,

      highlight = {
        enable = true,              -- Kolorowanie składni przez treesitter
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,              -- Ulepszony autoindent
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",   -- rozpocznij zaznaczanie
          node_incremental = "<C-space>", -- zaznacz większy blok
          node_decremental = "<C-bs>",    -- zaznacz mniejszy blok
        },
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
      },
    })
  end,
}

