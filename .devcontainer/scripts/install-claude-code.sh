#!/bin/bash
set -e

# Check if claude is already installed
if command -v claude &> /dev/null; then
    echo "Claude Code is already installed"
    exit 0
fi

# Install Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Add to PATH for current session
export PATH="$HOME/.local/bin:$PATH"

# Ensure PATH is set in .bashrc for future sessions
if ! grep -q 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc 2>/dev/null; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

echo "Claude Code installed successfully"
