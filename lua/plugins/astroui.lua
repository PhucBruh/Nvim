return {

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      colorscheme = "catppuccin",
      -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
      highlights = {
        init = { -- this table overrides highlights in all themes
          -- Normal = { bg = "#000000" },
        },
        astrotheme = { -- a table of overrides/changes when applying the astrotheme theme
          -- Normal = { bg = "#000000" },
        },
      },
      -- Icons can be configured throughout the interface
      icons = {
        -- configure the loading of the lsp in the status line
        LSPLoading1 = "⠋",
        LSPLoading2 = "⠙",
        LSPLoading3 = "⠹",
        LSPLoading4 = "⠸",
        LSPLoading5 = "⠼",
        LSPLoading6 = "⠴",
        LSPLoading7 = "⠦",
        LSPLoading8 = "⠧",
        LSPLoading9 = "⠇",
        LSPLoading10 = "⠏",
      },
    },
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "           ██████████████  █████       ",
        "         ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██      ",
        "         ██▒▒▒▒████████████▒▒██████    ",
        "       ██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██  ",
        "     ████▒▒▒▒▒▒░░░░░░░░░░░░▒▒░░░░░░░░░░",
        "   ██▒▒██▒▒▒▒░░░░██    ██░░░░██    ██░░",
        "   ██▒▒██▒▒▒▒░░██      ██░░██      ██░░",
        " ████▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░░░░░░░░░  ",
        " ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒░▒▒▒▒▒▒    ",
        " ██▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒▒▒▒▒██  ",
        " ██▒▒▒▒▒▒▒░░█████████░░▒▒▒▒▒▒░░░░▒▒██  ",
        " ██▒▒▒▒▒▒▒▒░░██░░░░████████████████████",
        "   ██▒▒▒▒▒▒▒░░██████░░░░░░░░░░░░░░░██  ",
        "   ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████████████████",
        "     ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    ",
        "       ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      ",
        "         ████▒▒▒▒▒▒▒▒▒▒▒▒██████        ",
        "             ██████████████            ",
      }
      return opts
    end,
  },

  -- color scheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      term_colors = true,

      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },

      color_overrides = {
        mocha = {
          base = "#151C1E",
          mantle = "#151C1E",
        },
      },

      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
        neotree = true,
        noice = true,
      },

      custom_highlights = function(_)
        local mocha = require("catppuccin.palettes").get_palette "mocha"

        return {
          -- Comment = { fg = colors.flamingo },
          -- TabLineSel = { bg = colors.pink },
          WinSeparator = { fg = mocha.blue },

          -- noice
          NoiceCmdlinePopupBorder = { fg = mocha.blue },
          NoiceCmdlinePopupBorderSearch = { fg = mocha.blue },
          NoiceConfirmBorder = { fg = mocha.blue },

          -- telescope
          TelescopeBorder = { fg = mocha.blue },
          TelescopePromptBorder = { fg = mocha.blue, bg = mocha.base },
        }
      end,
    },
  },

  -- for status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "meuter/lualine-so-fancy.nvim",
      "archibate/lualine-time",
    },
    opts = {
      options = {
        component_separators = { left = "│", right = "│" },
        -- section_separators = { left = "", right = "" },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { "fancy_mode", width = 3 },
        },
        lualine_b = {
          { "fancy_branch" },
          { "fancy_diff" },
        },
        lualine_c = {
          { "fancy_cwd", substitute_home = true },
        },
        lualine_x = {
          { "fancy_macro" },
          { "fancy_diagnostics" },
          { "fancy_searchcount" },
          { "fancy_location" },
        },
        lualine_y = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_z = {
          { "fancy_lsp_servers" },
          { "ctime" },
        },
      },
    },
  },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = nil

      opts.statuscolumn = { -- statuscolumn
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        status.component.signcolumn(),
        status.component.numbercolumn(),
        status.component.foldcolumn(),
      }
    end,
  },

  -- notifications and LSP progress messages
  {
    "j-hui/fidget.nvim",
    opts = {
      -- options
    },
  },

  -- indent line animation
  {
    "huy-hng/anyline.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    config = true,
  },

  -- web dev icon
  {
    "DaikyXendo/nvim-material-icon",
    config = function()
      require("nvim-material-icon").setup {
        -- your personnal ions can go here (to override)
        -- you can specify color or cterm_color instead of specifying both of them
        -- DevIcon will be appended to `name`
        override = {
          zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh",
          },
        },
        -- globally enable different highlight colors per icon (default to true)
        -- if set to false all icons will have the default icon's color
        color_icons = true,
        -- globally enable default icons (default to false)
        -- will get overriden by `get_icons` option
        default = true,
      }
    end,
  },
}
