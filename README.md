# dotfiles
setup for my dev environment

## Setup

```sh
./setup.sh
```

It asks whether you use vim or neovim, then links:

| Repo | Linked to |
|---|---|
| `vim/vimrc` or `nvim/` | `~/.vimrc` or `~/.config/nvim` |
| `tmux/tmux.conf` | `~/.tmux.conf` |
| `git/gitconfig` | `~/.gitconfig` |
| `homebrew/Brewfile` | `~/.Brewfile` |
| `claude/settings.json` | `~/.claude/settings.json` |

An existing `~/.config/nvim` directory or a real `~/.claude/settings.json` is moved to `*.bak.<timestamp>` first.

## zsh

`~/.zshrc` is not linked. It stays machine-local (installers write to it) and `setup.sh` adds a line that sources the shared `zsh/zshrc`:

```zsh
[ -f "<repo>/zsh/zshrc" ] && source "<repo>/zsh/zshrc"
```

- `zsh/zshrc`: shared PATH entries, aliases and the `claude` wrapper.
- `~/.zshrc`: anything tied to one machine (versioned tool paths, installer snippets).

## Claude Code

`claude/settings.json` holds the settings shared by every machine: permissions, tmux window-name hooks, status line, model and effort.

Machine-specific extras (plugins, marketplaces) go in a file that is **not** in this repo:

- `~/.claude/settings.work.json` on a work machine
- `~/.claude/settings.personal.json` on a personal machine

The `claude` wrapper in `zsh/zshrc` passes whichever one exists with `--settings`, so it loads on top of the shared settings. Work wins if both exist; with neither, plain `claude` runs. Use `command claude` to skip the extras.

Note: settings changed inside Claude Code (`/model`, effort, `/plugin install`) are saved to `~/.claude/settings.json`, i.e. this repo. `claude/hooks/settings-drift.sh` runs on session start, after each turn and on config changes, and warns (in Claude and as a macOS notification) when that file differs from the last commit in anything other than UI preferences (model, effort, thinking, fast mode, output style, renderer, theme and similar; the list is in the script). Move machine-specific changes to the extras file, or commit them.
