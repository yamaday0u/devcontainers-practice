# What

Dev Containers + Claude Codeの練習プロジェクト

## 開発環境のセットアップ

### 各種ツールのインストール

- **VS Code**：チームで開発環境を揃えるために推奨。
- **Docker Engine**: [Docker Desktop](https://docs.docker.com/desktop/) からインストールのが簡単。
- **VS Code拡張機能**: [.vscode/extensions.json](.vscode/extensions.json)に記載されている拡張機能をすべてインストールする。このリポジトリをVS Codeで開いていれば推奨拡張機能として表示される。

### Dev Containers を起動

初回起動時にClaude Codeをインストールします。

## Claude Code

**Claude Code 関連のファイル一覧**

```
.
├── .claude
│   ├── commands/*.md # カスタムコマンド
│   ├── settings.json # 権限などの設定
├── .github
│   └── workflows
│       ├── claude-code-review.yml # PRレビュー
│       └── claude.yml # Issue実装、PR作成など
├── CLAUDE.md # プロンプト
```
