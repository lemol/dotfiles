#!/usr/bin/env bash
#
# Tokyo Night terminal setup — cmux / Ghostty / Starship / nvim
#
#   ./install.sh            full install (brew + symlinks + config)
#   ./install.sh --links    symlinks and config only, skip Homebrew
#
# Safe to re-run: existing real files are backed up once to
# ~/.dotfiles-backup/<timestamp>/ before being replaced by a symlink.

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"
SKIP_BREW=false
[[ "${1:-}" == "--links" ]] && SKIP_BREW=true

bold()  { printf "\033[1m%s\033[0m\n" "$*"; }
info()  { printf "  \033[38;5;111m•\033[0m %s\n" "$*"; }
ok()    { printf "  \033[38;5;150m✓\033[0m %s\n" "$*"; }
warn()  { printf "  \033[38;5;215m!\033[0m %s\n" "$*"; }

# link <repo-relative-source> <absolute-destination>
link() {
  local src="$REPO/$1" dest="$2"
  mkdir -p "$(dirname "$dest")"

  if [[ -L "$dest" ]]; then
    if [[ "$(readlink "$dest")" == "$src" ]]; then
      ok "$dest (already linked)"
      return
    fi
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    mkdir -p "$BACKUP"
    mv "$dest" "$BACKUP/$(basename "$dest")"
    warn "backed up existing $dest → $BACKUP/"
  fi

  ln -s "$src" "$dest"
  ok "$dest"
}

# ── 1. Homebrew packages ──────────────────────────────────────
if [[ "$SKIP_BREW" == false ]]; then
  bold "Installing packages"
  if ! command -v brew >/dev/null 2>&1; then
    warn "Homebrew not found — install it from https://brew.sh then re-run."
    exit 1
  fi
  brew bundle --file="$REPO/Brewfile"
  ok "Brewfile applied"
else
  bold "Skipping Homebrew (--links)"
fi

# ── 2. Symlink configs ────────────────────────────────────────
bold "Linking configs"
link ghostty/config                       "$HOME/.config/ghostty/config"
link starship/starship.toml               "$HOME/.config/starship.toml"
link cmux/cmux.json                       "$HOME/.config/cmux/cmux.json"
link nvim                                 "$HOME/.config/nvim"

# ── 3. bat theme ──────────────────────────────────────────────
bold "Configuring bat"
if command -v bat >/dev/null 2>&1; then
  link bat/themes/tokyonight_night.tmTheme \
       "$(bat --config-dir)/themes/tokyonight_night.tmTheme"
  bat cache --build >/dev/null
  ok "bat theme cache rebuilt"
else
  warn "bat not installed — skipping theme"
fi

# ── 4. Hook zsh/modern.zsh into ~/.zshrc ──────────────────────
bold "Wiring up zsh"
ZSHRC="$HOME/.zshrc"
SOURCE_LINE="[ -f \"$REPO/zsh/modern.zsh\" ] && source \"$REPO/zsh/modern.zsh\""
touch "$ZSHRC"

if grep -qF "zsh/modern.zsh" "$ZSHRC"; then
  ok "~/.zshrc already sources modern.zsh"
else
  {
    echo ""
    echo "# Tokyo Night terminal setup (dotfiles repo)"
    echo "$SOURCE_LINE"
  } >> "$ZSHRC"
  ok "appended source line to ~/.zshrc"
fi

# Starship owns the prompt, so stop oh-my-zsh from rendering its own.
if grep -qE '^ZSH_THEME="[^"]+"' "$ZSHRC"; then
  cp "$ZSHRC" "$ZSHRC.pre-tokyonight"
  sed -i '' -E 's/^ZSH_THEME="[^"]+"/ZSH_THEME=""/' "$ZSHRC"
  ok 'ZSH_THEME set to "" (Starship renders the prompt)'
else
  ok "ZSH_THEME already empty or unset"
fi

# ── 5. git: delta as the diff pager ───────────────────────────
bold "Configuring git"
if command -v delta >/dev/null 2>&1; then
  git config --global core.pager "delta"
  git config --global interactive.diffFilter "delta --color-only"
  git config --global delta.navigate true
  git config --global delta.line-numbers true
  git config --global delta.syntax-theme "tokyonight_night"
  git config --global delta.true-color always
  git config --global merge.conflictstyle "zdiff3"
  git config --global diff.colorMoved default
  ok "delta configured as git pager"
else
  warn "delta not installed — skipping git pager config"
fi

# ── 6. Reload cmux if it is running ───────────────────────────
if command -v cmux >/dev/null 2>&1; then
  cmux reload-config >/dev/null 2>&1 && ok "cmux config reloaded" || \
    info "cmux installed but not running — config applies on launch"
fi

echo
bold "Done."
info "Open a new cmux tab (⌘T) to pick up the new prompt."
[[ -d "$BACKUP" ]] && info "Replaced files were backed up to $BACKUP"
exit 0
