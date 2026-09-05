return {
  -- =========================================================================
  -- TypeScript Error Translator
  -- Translates cryptic TypeScript compiler errors into plain English in hover & diagnostics.
  -- =========================================================================
  {
    "dmmulroy/ts-error-translator.nvim",
    ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    opts = {
      auto_attach = true,
      servers = {
        "vtsls",
        "ts_ls",
        "tsserver",
      },
    },
  },

  -- =========================================================================
  -- Package Info (NPM / Bun / PNPM)
  -- Shows dependency versions, outdated status, and updates inside package.json.
  -- =========================================================================
  {
    "vuki656/package-info.nvim",
    event = { "BufReadPre package.json" },
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      autostart = true,
      hide_up_to_date = false,
    },
    keys = {
      {
        "<leader>ns",
        function()
          require("package-info").show()
        end,
        desc = "Show Package Versions",
      },
      {
        "<leader>nu",
        function()
          require("package-info").update()
        end,
        desc = "Update Package",
      },
      {
        "<leader>nd",
        function()
          require("package-info").delete()
        end,
        desc = "Delete Package",
      },
      {
        "<leader>ni",
        function()
          require("package-info").install()
        end,
        desc = "Install New Package",
      },
      {
        "<leader>np",
        function()
          require("package-info").change_version()
        end,
        desc = "Change Package Version",
      },
    },
  },

  -- =========================================================================
  -- Neotest Adapters: Bun & Vitest
  -- Extends LazyVim's test.core extra with fast test runners for Bun and Vite.
  -- =========================================================================
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "jutonz/neotest-bun",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-bun"] = {},
        ["neotest-vitest"] = {},
      },
    },
  },

  -- =========================================================================
  -- Which-Key Labels
  -- Register <leader>n as package management
  -- =========================================================================
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>n", group = "packages/npm", icon = "󰏗" },
      },
    },
  },
}
