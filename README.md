# What

Dev Containers の練習プロジェクト

## 開発環境のセットアップ

### ツールのインストール

**Dockerをインストール**

[Docker Engine](https://docs.docker.com/engine/install/)をインストールする

**VS Code拡張機能のインストール**

- [DevContainers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)をインストール

### Dev Containers を起動

VS Codeの左下メニューからコンテナーを開く

## Claude Code

## 設定・権限

- [.claude/settings.json](.claude/settings.json) # プロジェクト共有設定
- .claude/settings.local.json # プロジェクトローカル設定

## メモリ（コンテキスト）

- [CLAUDE.md](CLAUDE.md) # プロジェクト指示（チーム共有）
- CLAUDE.local.md # 個人用プロジェクト指示

## カスタムコマンド

- .claude/commands/\*.md # プロジェクト用

<!-- ## MCP設定
- .mcp.json                        # MCPサーバー設定 -->

## GitHub Actions

- [.github/workflows/claude.yml](.github/workflows/claude.yml) # Issue実装、PR作成など
- [.github/workflows/claude-code-review.yml](.github/workflows/claude-code-review.yml) # PRレビュー
