-- Match the terminal: cmux/Ghostty runs "TokyoNight Night" (bg #1a1b26).
-- Pinning the same variant here means nvim and the shell share one background.
return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
      },
      -- Let the terminal's own background/blur show through the editor
      transparent = false,
      on_highlights = function(hl, c)
        -- Slightly brighter window separators so splits read clearly in cmux panes
        hl.WinSeparator = { fg = c.blue0, bold = true }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight-night" },
  },
  -- lualine is the modern vim-airline; LazyVim already wires it up.
  -- This just makes sure it follows the same theme.
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.theme = "tokyonight"
      opts.options.globalstatus = true
      return opts
    end,
  },
}
