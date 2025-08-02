---
description: Create meaningful git commits by analyzing diff and grouping related changes
allowed-tools: Bash(git status:*), Bash(git diff:*), Bash(git add:*), Bash(git commit:*)
---

# Smart Git Commit

現在のdiffを分析して、意味のある単位でファイルをグループ化し、適切なcommitメッセージでcommitを作成します。

## Current Repository Status

!`git status --porcelain`

## Current Changes (Staged and Unstaged)

!`git diff HEAD`

## Your Task

1. 上記のdiffを分析して、変更内容を理解してください
2. 関連する変更をグループ化して、論理的な単位に分けてください
3. 各グループに対して適切なcommitメッセージを作成してください
4. conventional commit形式（`<type>(<scope>): <subject>`）に従ってください
5. 必要に応じて複数のcommitに分けて実行してください

## Commit Guidelines

- **Type**: feat, fix, docs, style, refactor, test, chore, perf
- **Scope**: 変更された機能やモジュール名（省略可能）
- **Subject**: 変更内容の簡潔な説明（英語、動詞で開始）

## Example Workflow

1. 関連するファイルをstageして最初のcommitを作成
2. 残りの変更を分析して次のcommitグループを決定
3. すべての変更がcommitされるまで繰り返し

## Important Notes

- commitする前に必ずテストを実行してください（`make test`）
- コードフォーマットを実行してください（`make fmt`）
- 各commitは独立して動作する状態にしてください
- commitメッセージは英語で記述してください