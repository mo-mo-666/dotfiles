# mo-mo-'s Dotfiles
[![Install on Mac](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-mac.yml/badge.svg)](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-mac.yml)
[![Install on Linux Normal](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-linux-normal.yml/badge.svg)](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-linux-normal.yml)
[![Install on Linuxbrew](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-linuxbrew.yml/badge.svg)](https://github.com/mo-mo-666/dotfiles/actions/workflows/install-linuxbrew.yml)
[![Install on Windows](https://github.com/mo-mo-666/dotfiles/actions/workflows/windows-install.yml/badge.svg)](https://github.com/mo-mo-666/dotfiles/actions/workflows/windows-install.yml)

Deploy and Initialize for Mac, Linux(Ubuntu), and WSL(Ubuntu).

## 用語

### deploy
dotfiles にリンクを張ること。`deploy.sh` に対応。

### initialize
インストール・初期設定すべて行うこと。`install.sh` に対応。

## インストール
```bash
cd ~
git clone https://github.com/mo-mo-666/dotfiles.git
cd dotfiles
```
git がない場合は他のツールを使うか，git をインストールしてから実行するとよい。
### 注意
**このリポジトリは `${HOME}`直下におかれることを想定している。**

## ディレクトリ構成

### `_dotfiles/`
各マシン共通で使う dotfile を置く場所。

### `dotfiles/`
個々のマシン独自の設定をする dotfile を置く場所。`_dotfiles` より優先的に読み込まれる。
Git の管理外になる。

### `backup/`
`dotfiles.sh` を強制実行したときに，もともとあった dotfiles のバックアップをとる場所。
Git の管理外になる。

### `others/`
その他の設定ファイルを入れておくところ。適宜コピペして使うことを想定。

### `util/`
ユーティリティスクリプトを入れておくところ。

## `deploy.sh`

- 通常実行

既に dotfile がある場合は上書きしない。

```bash
./deploy.sh
```

- 強制実行

既に dotfile がある場合も上書きし，既存のものは `backup/` に移動する。

```bash
./deploy.sh force
```

## `install.sh`

デプロイからライブラリのインストール・初期設定まですべて行う。

**注意：WSLのとき，まず `others/wsl.conf` を `/etc/wsl.conf` にコピーし，再起動してから実行すること。**

- Mac のとき

```bash
./install.sh mac
```

- Linux or WSL (Ubuntu) + 標準インストールのとき

```bash
./install.sh linux_normal
```

- Linux or WSL (Ubuntu) + Linuxbrew のとき

```bash
./install.sh linuxbrew
```

内部でも OS 判定を行っているので，それと一致していないとエラーになる。


## `func_*.sh`
基本的に単独実行は想定していないので実行しないこと。

## Windows について
Windows は `winget` を用いてインストールを行う。
```powershell
winget import winget-private.json
```


## バックアップバッケージの更新方法
- Mac
```bash
cd ~/dotfiles
brew bundle dump -f --file=Brewfile_mac
```

- Linuxbrew
```bash
cd ~/dotfiles
brew bundle dump -f --file=Brewfile_ubuntu
```

- Windows  
```powershell
winget export <出力ファイル名>
```
