-- Multiple cursors: https://github.com/jake-stewart/multicursor.nvim
-- Keys avoid LazyVim defaults (<C-Up/Down> resize, <leader>n notifications, S flash).
return {
  {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    event = "VeryLazy",
    config = function()
      local mc = require("multicursor-nvim")
      mc.setup()

      local set = vim.keymap.set

      -- Add/skip cursor above/below
      set({ "n", "x" }, "<M-Up>", function() mc.lineAddCursor(-1) end, { desc = "Cursor: add above" })
      set({ "n", "x" }, "<M-Down>", function() mc.lineAddCursor(1) end, { desc = "Cursor: add below" })

      -- Add/skip cursor at next/prev match of word (or visual selection)
      set({ "n", "x" }, "<C-n>", function() mc.matchAddCursor(1) end, { desc = "Cursor: add next match" })
      set({ "n", "x" }, "<leader>mn", function() mc.matchAddCursor(1) end, { desc = "Add next match" })
      set({ "n", "x" }, "<leader>mN", function() mc.matchAddCursor(-1) end, { desc = "Add prev match" })
      set({ "n", "x" }, "<leader>ms", function() mc.matchSkipCursor(1) end, { desc = "Skip next match" })
      set({ "n", "x" }, "<leader>mS", function() mc.matchSkipCursor(-1) end, { desc = "Skip prev match" })
      set({ "n", "x" }, "<leader>mA", mc.matchAllAddCursors, { desc = "Add all matches" })
      set({ "n", "x" }, "<leader>mt", mc.toggleCursor, { desc = "Toggle cursor here" })
      set("n", "<leader>mr", mc.restoreCursors, { desc = "Restore cursors" })

      -- Visual mode: cursor per line, or split/match by regex
      set("x", "I", mc.insertVisual, { desc = "Cursor: insert each line" })
      set("x", "A", mc.appendVisual, { desc = "Cursor: append each line" })
      set("x", "<leader>mm", mc.matchCursors, { desc = "Cursors on regex match" })
      set("x", "<leader>mx", mc.splitCursors, { desc = "Split selection by regex" })

      -- Ctrl+click to add/remove cursors
      set("n", "<C-LeftMouse>", mc.handleMouse)
      set("n", "<C-LeftDrag>", mc.handleMouseDrag)
      set("n", "<C-LeftRelease>", mc.handleMouseRelease)

      -- Only active while there are multiple cursors
      mc.addKeymapLayer(function(layerSet)
        layerSet({ "n", "x" }, "<left>", mc.prevCursor)
        layerSet({ "n", "x" }, "<right>", mc.nextCursor)
        layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)
        layerSet("n", "<esc>", function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          else
            mc.clearCursors()
          end
        end)
      end)
    end,
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>m", group = "multicursor", icon = "󰇀", mode = { "n", "x" } },
      },
    },
  },
}
