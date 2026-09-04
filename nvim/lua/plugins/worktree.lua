return {
  {
    "awerebea/git-worktrees.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = { "GitWorktreeTotal", "GitWorktreeAdd", "GitWorktreeManage", "GitBranchManage" },
    keys = {
      {
        "<leader>gws",
        function()
          require("git-worktrees").worktrees_manage()
        end,
        desc = "Switch Worktree",
      },
      {
        "<leader>gwm",
        function()
          require("git-worktrees").worktrees_manage()
        end,
        desc = "Manage Worktrees",
      },
      {
        "<leader>gwt",
        function()
          require("git-worktrees").worktrees()
        end,
        desc = "Worktree Total (All)",
      },
      {
        "<leader>gwa",
        function()
          require("git-worktrees").worktrees_add()
        end,
        desc = "Add Worktree",
      },
      {
        "<leader>gwb",
        function()
          require("git-worktrees").branches()
        end,
        desc = "Branch Management",
      },
    },
    opts = {
      -- Swap current buffer to the equivalent file in the new worktree if it exists
      swap_current_buffer = true,
      hooks = {
        on_switch = function(from, to)
          vim.notify("Switched worktree: " .. to, vim.log.levels.INFO, { title = "Git Worktree" })
        end,
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>gw", group = "worktrees", icon = "󰙅" },
      },
    },
  },
}
