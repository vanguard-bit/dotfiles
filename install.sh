#!/usr/bin/env bash
# Install tracked configs into $HOME (backs up existing files as *.dotfiles-bak.TIMESTAMP).
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_ROOT/home"
DEST="${HOME:?}"
TS="$(date +%Y%m%d-%H%M%S)"
UID_NUM="$(id -u)"

backup_if_exists() {
  local target=$1
  if [[ -e $target && ! -L $target ]]; then
    cp -a "$target" "${target}.dotfiles-bak.${TS}"
  fi
}

install_file() {
  local rel=$1
  local src="$SRC/$rel"
  local dst="$DEST/$rel"
  [[ -f $src ]] || return 0
  mkdir -p "$(dirname "$dst")"
  if [[ -e $dst || -L $dst ]]; then
    if [[ -L $dst && "$(readlink -f "$dst")" == "$(readlink -f "$src")" ]]; then
      return 0
    fi
    backup_if_exists "$dst"
    rm -f "$dst"
  fi
  ln -sf "$src" "$dst"
}

install_tree() {
  local rel=$1
  local src="$SRC/$rel"
  local dst="$DEST/$rel"
  [[ -d $src ]] || return 0
  mkdir -p "$(dirname "$dst")"
  if [[ -e $dst && ! -d $dst ]]; then
    backup_if_exists "$dst"
    rm -f "$dst"
  fi
  mkdir -p "$dst"
  rsync -a --delete --backup --backup-dir="$DEST/.dotfiles-backup/$TS" "$src/" "$dst/"
}

echo "Installing dotfiles from $REPO_ROOT"

install_file ".gitconfig"
install_file ".zshrc"
install_tree ".config/nvim"
install_tree ".config/kitty"
install_tree ".config/copyq"
install_file ".config/git/gitk"
install_tree ".config/xfce4/xfconf/xfce-perchannel-xml"
install_file ".config/mimeapps.list"

mkdir -p "$DEST/.config/dotfiles"
if [[ ! -f $DEST/.config/dotfiles/secrets.zsh ]]; then
  cp "$SRC/.config/dotfiles/secrets.zsh.example" "$DEST/.config/dotfiles/secrets.zsh"
  chmod 600 "$DEST/.config/dotfiles/secrets.zsh"
  echo "Created ~/.config/dotfiles/secrets.zsh from example (edit with your tokens)."
fi

ENV_EXAMPLE="$SRC/.config/environment.d/99-unified-dbus.conf.example"
ENV_DEST="$DEST/.config/environment.d/99-unified-dbus.conf"
if [[ -f $ENV_EXAMPLE ]]; then
  mkdir -p "$(dirname "$ENV_DEST")"
  sed "s/@UID@/$UID_NUM/g" "$ENV_EXAMPLE" >"$ENV_DEST"
  echo "Wrote $ENV_DEST for UID $UID_NUM"
fi

echo "Done. Open a new shell for .zshrc changes; log out/in for Xfce shortcuts."
