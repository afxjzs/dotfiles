#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)

backup_and_copy() {
  local src="$1"
  local dest="$2"

  if [ -f "$dest" ]; then
    local backup="${dest}.backup.${TIMESTAMP}"
    echo "  Backing up $dest → $backup"
    cp "$dest" "$backup"
  fi

  echo "  Copying $(basename "$src") → $dest"
  cp "$src" "$dest"
}

echo "Installing dotfiles from $DOTFILES_DIR"
echo ""

backup_and_copy "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

if [ -f "$DOTFILES_DIR/.zshrc.local" ]; then
  backup_and_copy "$DOTFILES_DIR/.zshrc.local" "$HOME/.zshrc.local"
else
  echo "  Skipping .zshrc.local (not found — copy .zshrc.local.example to .zshrc.local and fill it in)"
fi

echo ""
echo "Done. Run: source ~/.zshrc"
