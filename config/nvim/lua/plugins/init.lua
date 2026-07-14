require("lazy").setup({
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-tree/nvim-tree.lua" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "lewis6991/gitsigns.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      local ls_theme = {
        normal   = { a={fg="#161b22",bg="#7eb8c9",bold=true}, b={fg="#f0ece4",bg="#2e3440"}, c={fg="#c8c0b4",bg="NONE"} },
        insert   = { a={fg="#161b22",bg="#6a9e82",bold=true}, b={fg="#f0ece4",bg="#2e3440"}, c={fg="#c8c0b4",bg="NONE"} },
        visual   = { a={fg="#161b22",bg="#9b7ec8",bold=true}, b={fg="#f0ece4",bg="#2e3440"}, c={fg="#c8c0b4",bg="NONE"} },
        replace  = { a={fg="#161b22",bg="#c4738a",bold=true}, b={fg="#f0ece4",bg="#2e3440"}, c={fg="#c8c0b4",bg="NONE"} },
        command  = { a={fg="#161b22",bg="#d4a843",bold=true}, b={fg="#f0ece4",bg="#2e3440"}, c={fg="#c8c0b4",bg="NONE"} },
        inactive = { a={fg="#4c566a",bg="#2e3440"}, c={fg="#4c566a",bg="NONE"} },
      }
      require("lualine").setup({
        options = { theme=ls_theme, component_separators="", section_separators="" },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },
})
