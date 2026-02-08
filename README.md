# dotfiles

chezmoi で管理している dotfiles です。

## セットアップ

```bash
# chezmoi をインストール
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin

# このリポジトリを適用
chezmoi init --apply <github-username>
```

## マシン固有の設定

PATH設定などマシン固有の設定は `~/.zshrc.local` に記述してください（管理対象外）。

```bash
# ~/.zshrc.local の例
export PATH="$HOME/.local/bin:$PATH"
```

## 基本コマンド

```bash
chezmoi edit ~/.zshrc   # 設定を編集
chezmoi diff            # 差分確認
chezmoi apply           # 適用
chezmoi update          # リモートから更新
chezmoi cd              # ソースディレクトリに移動
```
