#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/bin"
REPO="https://raw.githubusercontent.com/sopenlaz0/codex-copilot-auth/main/bin"

mkdir -p "$INSTALL_DIR"

echo "Installing codex-auth..."
curl -fsSL "$REPO/codex-auth" -o "$INSTALL_DIR/codex-auth"
chmod +x "$INSTALL_DIR/codex-auth"

echo "Installing copilot-auth..."
curl -fsSL "$REPO/copilot-auth" -o "$INSTALL_DIR/copilot-auth"
chmod +x "$INSTALL_DIR/copilot-auth"

# Ensure ~/.local/bin is on PATH
if ! echo "$PATH" | grep -q "$HOME/.local/bin"; then
  echo ""
  echo "NOTE: Add ~/.local/bin to your PATH. Add this to your ~/.zshrc or ~/.bashrc:"
  echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
fi

echo ""
echo "Done! Commands available:"
echo "  codex-auth    - Manage multiple Codex CLI accounts"
echo "  copilot-auth  - Manage multiple GitHub Copilot accounts (opencode)"
echo ""
echo "Run 'codex-auth' or 'copilot-auth' to get started."
