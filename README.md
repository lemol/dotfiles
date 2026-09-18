# dotfiles

macOS terminal setup: **cmux** + **Ghostty** + **Starship**, themed Tokyo Night end to end.

```
   …/dotfiles   main ✱2 ?1        v25.4.0  󱎫 3s  21:17
❯
```

Left side is a chained powerline: os → directory → git branch and status.
Right side carries language version, command duration (only when it exceeds 2s), and a clock.

> The pre-2016 Arch / xmonad / tmux / vim configuration lives on the **`v1`** branch.

## Install on a fresh machine

```sh
# 1. Homebrew, if it isn't there yet
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 2. Clone and run
git clone https://github.com/lemol/dotfiles.git ~/Labs/lemol/dotfiles
cd ~/Labs/lemol/dotfiles
./install.sh
```

That installs everything in the `Brewfile` (including `lazygit`, which LazyVim's
`<leader>gg` needs), symlinks the configs, builds the `bat` theme cache, points
`git diff` at `delta`, and hooks `zsh/modern.zsh` into `~/.zshrc`.

Then open a new cmux tab (`⌘T`) to pick up the prompt.

**Flags**

| Command | Does |
| --- | --- |
| `./install.sh` | Full install: Homebrew packages + symlinks + config |
| `./install.sh --links` | Symlinks and config only, skips Homebrew |

Re-running is safe. Any real file it would overwrite is moved to
`~/.dotfiles-backup/<timestamp>/` first, and existing symlinks are left alone.

## What lives where

| Repo path | Symlinked to | Purpose |
| --- | --- | --- |
| `ghostty/config` | `~/.config/ghostty/config` | Theme, font, padding, opacity, blur |
| `starship/starship.toml` | `~/.config/starship.toml` | The powerline prompt |
| `cmux/cmux.json` | `~/.config/cmux/cmux.json` | cmux app chrome and sidebar |
| `herdr/config.toml` | `~/.config/herdr/config.toml` | Herdr agent multiplexer config (prefix: `ctrl+a`, Tokyo Night theme) |
| `nvim/` | `~/.config/nvim` | Whole LazyVim config, incl. plugin version pins |
| `bat/themes/*.tmTheme` | `~/.config/bat/themes/` | Tokyo Night syntax theme for `bat` and `delta` |
| `zsh/modern.zsh` | *sourced* from `~/.zshrc` | Prompt init, `eza`/`bat`/`zoxide`/`fzf` setup |

`~/.zshrc` itself is **not** symlinked — it holds machine-specific paths (nvm, gcloud,
pnpm, bun). The installer only appends a single `source` line pointing back here.

## Neovim

The full Neovim config is tracked here and symlinked as a whole directory:
`~/.config/nvim` → `dotfiles/nvim`. It is [LazyVim](https://lazyvim.org) with the
colorscheme pinned to `tokyonight-night`, so the editor background is the exact
`#1a1b26` the terminal uses and a split pane reads as one surface.

Nothing extra to bootstrap. `install.sh` links the directory, and on first launch
`lazy.nvim` installs the plugins pinned in `lazy-lock.json` — meaning another machine
gets the *same* plugin versions, not just the same config.

```sh
nvim        # first run installs plugins, then you're done
```

| File | Role |
| --- | --- |
| `nvim/lazy-lock.json` | Exact plugin commit pins — commit this after `:Lazy update` |
| `nvim/lazyvim.json` | Which LazyVim extras are enabled (`:LazyExtras` edits it) |
| `nvim/lua/plugins/colorscheme.lua` | Tokyo Night pin + lualine theme |
| `nvim/lua/config/*.lua` | Your options, keymaps, autocmds |

Requires Neovim **0.11+**; the `Brewfile` installs current stable.

`<leader>gg` opens **lazygit** in a floating window (`<leader>gG` for cwd instead of
the git root). LazyVim registers those keymaps only when `lazygit` is on `$PATH`, so
they silently don't exist without it — the `Brewfile` installs it. It also works
standalone:

```sh
lazygit     # stage, commit, branch, rebase, cherry-pick from the TUI
```

Add language support and tooling with `:LazyExtras` inside nvim — it writes to
`lazyvim.json`, so commit that file to carry the choice to other machines.

## Notes

**cmux embeds Ghostty**, so terminal appearance is set in `ghostty/config`, not in
cmux's own settings. `cmux themes` reports the theme as inherited from that file.

**Reload without restarting:**

```sh
cmux reload-config          # reloads BOTH ghostty/config and cmux.json, refreshes terminals
herdr server reload-config  # reloads herdr config.toml in running Herdr server
```

**Herdr keybindings:**
- Prefix key is configured to `Ctrl+a` (e.g. `Ctrl+a ?` for help, `Ctrl+a c` for new tab, `Ctrl+a q` to detach).


**Common tweaks**

- Font size → `font-size` in `ghostty/config`
- Theme → `theme` in `ghostty/config` (`cmux themes list` shows all ~400)
- Transparency → `background-opacity` / `background-blur-radius`
- Prompt segments → the `format` block at the top of `starship/starship.toml`

Each prompt segment carries its own separators, so the git block disappears cleanly
outside a repo and the language block only appears when one is actually detected —
no leftover coloured wedges.

**Dependencies** are pinned in `Brewfile`. `nvim` uses [LazyVim](https://lazyvim.org);
the colorscheme file here assumes that base is already bootstrapped.

## Requirements

- macOS with Homebrew
- A Nerd Font (the `Brewfile` installs FiraCode Nerd Font) — required for the prompt glyphs
- oh-my-zsh, if you want the `vi-mode` cursor behaviour `modern.zsh` expects
