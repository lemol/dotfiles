# ═══════════════════════════════════════════════════════════════
#  Modern terminal setup (cmux / Ghostty)  —  Tokyo Night
#
#  Sourced from ~/.zshrc. Keep this file free of machine-specific
#  paths: ~/.zshrc holds those (nvm, gcloud, pnpm, bun, ...).
#  Every block is guarded so a missing tool degrades quietly.
# ═══════════════════════════════════════════════════════════════

# ── Prompt: Starship. Config at ~/.config/starship.toml ────────
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# Change the cursor shape in vi normal/insert mode (oh-my-zsh vi-mode plugin)
VI_MODE_SET_CURSOR=true

# ── Smarter cd: `z <partial-dir>` jumps to frecent matches ─────
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ── Better ls: eza with icons + git status ─────────────────────
if command -v eza >/dev/null 2>&1; then
  alias ls='eza --icons --group-directories-first'
  alias ll='eza --icons --group-directories-first -l --git --time-style=relative'
  alias la='eza --icons --group-directories-first -la --git --time-style=relative'
  alias lt='eza --icons --group-directories-first --tree --level=2'
fi

# ── Better cat / man: bat with syntax highlighting ─────────────
if command -v bat >/dev/null 2>&1; then
  export BAT_THEME="tokyonight_night"
  alias cat='bat --style=plain --paging=never'
  alias catp='bat'                     # with line numbers + git gutter
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
  export MANROFFOPT="-c"
fi

# ── fzf: Tokyo Night colours + bat preview ────────────────────
if command -v fzf >/dev/null 2>&1; then
  if command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  fi
  export FZF_DEFAULT_OPTS="
    --height 45% --layout=reverse --border=rounded --info=inline
    --color=bg+:#292e42,bg:#1a1b26,spinner:#bb9af7,hl:#7aa2f7
    --color=fg:#c0caf5,header:#7aa2f7,info:#e0af68,pointer:#bb9af7
    --color=marker:#9ece6a,fg+:#c0caf5,prompt:#7aa2f7,hl+:#7dcfff
    --color=border:#414868
    --prompt='  ' --pointer='▶' --marker='✓'"
  command -v bat >/dev/null 2>&1 && \
    export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :300 {}'"
  command -v eza >/dev/null 2>&1 && \
    export FZF_ALT_C_OPTS="--preview 'eza --icons --tree --level=2 --color=always {}'"
fi

# ── Colourful less / grep ──────────────────────────────────────
export LESS='-R'
alias grep='grep --color=auto'
