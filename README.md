# dotfiles

Personal Linux desktop and shell configuration (Kali + Xfce).

## What’s included

| Path | Description |
|------|-------------|
| `home/.config/nvim/` | LazyVim-based Neovim (plugins, LSP, keymaps) |
| `home/.config/kitty/` | Kitty terminal (font, cursor, colors, keymaps) |
| `home/.config/xfce4/xfconf/xfce-perchannel-xml/` | Xfce keyboard shortcuts, window manager, panel, terminal, theme, displays |
| `home/.zshrc` | Zsh (Kali defaults + NVM lazy load, Android/Hadoop paths, Cursor agent aliases, editor vars) |
| `home/.gitconfig` | Git user + `gh` credential helper |
| `home/.config/copyq/` | CopyQ settings and commands (no clipboard session data) |
| `home/.config/git/gitk` | gitk preferences |
| `home/.config/environment.d/` | systemd user environment template for unified DBus/keyring |
| `home/.config/mimeapps.list` | Default applications |

## Secrets

API tokens are **not** in git. After install, edit:

```bash
~/.config/dotfiles/secrets.zsh   # from secrets.zsh.example
```

Your live machine may still have tokens in `~/.zshrc`; move them into `secrets.zsh` and rely on the repo copy of `.zshrc`, which sources that file.

## Install

```bash
cd ~/projects/dotfiles
chmod +x install.sh
./install.sh
```

This symlinks `~/.gitconfig` and `~/.zshrc`, rsyncs config directories (with backup), and writes `~/.config/environment.d/99-unified-dbus.conf` using your UID.

**Xfce:** shortcut changes apply after re-login or:

```bash
xfconf-query -c xfce4-keyboard-shortcuts -l
# or restart xfconfd / session
```

**Neovim:** first launch runs Lazy.nvim bootstrap; run `:Lazy sync` if needed.

## Not tracked (on purpose)

- Cursor / IDE state, browser profiles, SSH keys, `pass`, cloud SDK installs
- CopyQ tab data, geometry, encryption keys
- Full Xfce panel launcher `.desktop` trees (machine-specific app IDs)
- Built-from-source Kitty under `~/.local/bin/kitty` (shortcut uses `kitty` on `PATH`)

## Sync updates from this machine

Re-copy from live config, then re-sanitize secrets:

```bash
./scripts/pull-from-home.sh   # if added later
```

Manual refresh example:

```bash
rsync -a ~/.config/nvim/ ~/projects/dotfiles/home/.config/nvim/
```
