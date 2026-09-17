-- Open the Claude Code terminal as a horizontal split at the bottom
return {
  {
    "coder/claudecode.nvim",
    opts = {
      terminal = {
        snacks_win_opts = {
          position = "bottom",
          height = 0.35,
          width = 0,
        },
      },
    },
  },
}
