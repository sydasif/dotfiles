#!/bin/bash
# Restore Neovim config from dotfiles
# Usage: ./restore-nvim.sh

set -e

echo "Restoring Neovim configuration..."

# Create config directory if it doesn't exist
mkdir -p ~/.config

# Create symlink to dotfiles nvim config
ln -sf ~/.dotfiles/nvim ~/.config/nvim

echo "✅ Neovim config restored!"
echo "💡 Run 'nvim' to start with your configuration"
echo "📦 Run 'nvim --headless -c \"Lazy sync\" -c \"qa\"' to install plugins"