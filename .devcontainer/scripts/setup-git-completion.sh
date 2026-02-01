#!/bin/bash
set -e

COMPLETION_FILE="$HOME/.git-completion.zsh"
PROMPT_FILE="$HOME/.git-prompt.sh"
ZSHRC="$HOME/.zshrc"

# 既にセットアップ済みか確認
if [ -f "$COMPLETION_FILE" ] && [ -f "$PROMPT_FILE" ] && grep -q 'source ~/.git-prompt.sh' "$ZSHRC" 2>/dev/null; then
    echo "Git completion and prompt are already set up"
    exit 0
fi

# git-completion.zsh をダウンロード
if [ ! -f "$COMPLETION_FILE" ]; then
    curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh \
      -o "$COMPLETION_FILE"
fi

# git-prompt.sh をダウンロード（zshでも使用可能）
if [ ! -f "$PROMPT_FILE" ]; then
    curl -fsSL https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
      -o "$PROMPT_FILE"
fi

# .zshrc に設定を追加
if ! grep -q 'source ~/.git-prompt.sh' "$ZSHRC" 2>/dev/null; then
    cat >> "$ZSHRC" << 'EOF'

# Git completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.zsh
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Git prompt
source ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWCOLORHINTS=1

# カスタムプロンプト（ブランチ名表示付き）
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}$(__git_ps1 " (%s)")%f$ '
EOF
fi

echo "Git completion and prompt set up successfully"
