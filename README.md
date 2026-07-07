# Dotfiles

My personal terminal setup for macOS — WezTerm, Zsh, Starship, and a few CLI tools, themed around [Dracula](https://draculatheme.com/).

## What's in here

| File | What it configures |
|------|--------------------|
| `.wezterm.lua` | WezTerm terminal emulator (theme, font, splits) |
| `.zshrc` | Zsh shell (PATH, aliases, tool init) |
| `starship.toml` | Starship prompt (two-line, git-aware) |
| `.nanorc` | Nano editor (line numbers, syntax colors) |

## Tools used

- **[WezTerm](https://wezfurlong.org/wezterm/)** — GPU-accelerated terminal emulator with native split panes
- **[Starship](https://starship.rs/)** — cross-shell prompt, shows directory, git branch, and status
- **[eza](https://eza.rocks/)** — modern `ls` replacement with git status column *(optional)*
- **[Nerd Font](https://www.nerdfonts.com/)** — JetBrainsMono Nerd Font, for icons/glyphs

## Setup on a new machine

Install the tools with [Homebrew](https://brew.sh/):

```sh
brew install starship eza nano gh
brew install --cask wezterm font-jetbrains-mono-nerd-font
```

Then copy the config files to their locations:

```sh
cp .wezterm.lua ~/.wezterm.lua
cp .zshrc ~/.zshrc
cp starship.toml ~/.config/starship.toml
cp .nanorc ~/.nanorc
```

Reload the shell:

```sh
source ~/.zshrc
```

## WezTerm

- **Theme:** Dracula
- **Font:** JetBrainsMono Nerd Font, 14pt
- **Tab bar:** hidden when only one tab is open

### Keybindings

| Shortcut | Action |
|----------|--------|
| `CMD + D` | Split pane left/right |
| `CMD + SHIFT + D` | Split pane top/bottom |
| `CMD + ← / → / ↑ / ↓` | Move focus between split panes |
| `CMD + T` | New tab |
| `CMD + [` / `CMD + ]` | Previous / next tab |
| `CMD + 1`–`9` | Jump to tab by number |

## Starship prompt

- Two-line layout: directory + git info on top, prompt symbol below
- Dracula-colored (purple directory, pink git branch, yellow git status)
- Shows language versions (Node, Python, Rust) when in a relevant project
- Shows command duration for commands that take longer than 2 seconds

### Git status symbols (in prompt)

| Symbol | Meaning |
|--------|---------|
| `!` | Modified |
| `+` | Staged |
| `?` | Untracked |
| `»` | Renamed |
| `✘` | Deleted |
| `$` | Stashed |

## Zsh

Homebrew's `bin` is added to the front of `PATH` so brew-installed tools (like GNU nano) take precedence over the macOS built-ins.

### Aliases

*(Adjust to match your `.zshrc` — these reflect the eza-based setup.)*

| Alias | Command | What it does |
|-------|---------|--------------|
| `ls` | `eza --git --group-directories-first` | Listing with git status, folders first |
| `ll` | `eza -l --git --group-directories-first` | Long format |
| `la` | `eza -la --git --group-directories-first` | Long format, including hidden files |
| `lt` | `eza --tree --level=2` | Tree view, 2 levels deep |

### eza git column

| Code | Meaning |
|------|---------|
| `--` | Unchanged |
| `M` | Modified |
| `N` | New / untracked |
| `I` | Ignored (in `.gitignore`) |
| `D` | Deleted |

## Nano

- Line numbers enabled
- Custom syntax colors for Lua config files
- Requires GNU nano (installed via Homebrew), **not** the macOS built-in pico

---

*Themed with [Dracula](https://draculatheme.com/). Built one tweak at a time.*
