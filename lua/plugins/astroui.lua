return {

  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- change colorscheme
      -- colorscheme = "catppuccin-mocha",
    },
  },

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
           ██████████████  █████       
         ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒██      
         ██▒▒▒▒████████████▒▒██████    
       ██▒▒▒▒██▒▒▒▒▒▒▒▒▒▒▒▒██▒▒▒▒▒▒██  
     ████▒▒▒▒▒▒░░░░░░░░░░░░▒▒░░░░░░░░░░
   ██▒▒██▒▒▒▒░░░░██    ██░░░░██    ██░░
   ██▒▒██▒▒▒▒░░██      ██░░██      ██░░
 ████▒▒▒▒▒▒▒▒▒▒░░░░░░░░░░▒▒░░░░░░░░░░  
 ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒▒▒▒░▒▒▒▒▒▒    
 ██▒▒▒▒▒▒▒░░░▒▒▒▒▒▒▒▒▒▒░░▒▒░░▒▒▒▒▒▒██  
 ██▒▒▒▒▒▒▒░░█████████░░▒▒▒▒▒▒░░░░▒▒██  
 ██▒▒▒▒▒▒▒▒░░██░░░░████████████████████
   ██▒▒▒▒▒▒▒░░██████░░░░░░░░░░░░░░░██  
   ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒████████████████████
     ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██    
       ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██      
         ████▒▒▒▒▒▒▒▒▒▒▒▒██████        
             ██████████████            
]]

      -- customize the dashboard header
      opts.section.header.val = vim.split(logo, "\n")

      opts.section.buttons.val = { nil }
      return opts
    end,
  },

  -- color scheme
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      opts.statuscolumn = { -- statuscolumn
        init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
        status.component.signcolumn(),
        status.component.numbercolumn(),
        status.component.foldcolumn(),
      }
    end,
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

  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function()
      -- don't use animate when scrolling with the mouse
      local mouse_scrolled = false
      for _, scroll in ipairs { "Up", "Down" } do
        local key = "<ScrollWheel" .. scroll .. ">"
        vim.keymap.set({ "", "i" }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      local animate = require "mini.animate"
      return {
        resize = {
          timing = animate.gen_timing.linear { duration = 100, unit = "total" },
        },
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = "total" },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
      }
    end,
  },

  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup { -- Optional, you don't have to run setup.
        groups = { -- table: default groups
          "BufferLineTabClose",
          "BufferlineBufferSelected",
          "BufferLineFill",
          "BufferLineBackground",
          "BufferLineSeparator",
          "BufferLineIndicatorSelected",
          "BufferLineDevIconDefault",
          "Normal",
          "SignColumn",
          "NormalNC",
          "TelescopeBorder",
          "NvimTreeNormal",
          "EndOfBuffer",
          "MsgArea",
          "WhichKeyFloat",
          "FloatBorder",
          "NormalFloat",
          "VertSplit",
          "WinBar",
          "StatusLine",
          "StatusLineNC",
          "WinBarNC",
          "TelescopeNormal",
          "DiffviewNormal",
          --
          "LspReferenceText",
          "LspReferenceRead",
          "LspReferenceText",
          "LspFloatWinNormal",
          "LspReferenceWrite",
          "CmpDocumentation",
          "NormalSB", -- help tag
          "SignColumnSB", -- help tag
        },
        extra_groups = {
          "NeoTreeNormal",
          "NeoTreeNormalNC",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      }
    end,
  },
}
