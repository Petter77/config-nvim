return {
  "catppuccin/nvim",
  name = "catppuccin", -- ważne przy użyciu lazy
  priority = 1000, -- musi się załadować przed innymi
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- lub latte, frappe, macchiato
      integrations = {
        treesitter = true, -- ✅ to jest kluczowe
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        indent_blankline = {
          enabled = true,
          scope_color = "", -- domyślnie
          colored_indent_levels = false,
        },
        dashboard = true,
        markdown = true,
      },
    })

    -- Ustawienie kolorystyki
    vim.cmd.colorscheme("catppuccin")
  end,
}

