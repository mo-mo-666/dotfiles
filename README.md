# mo-mo-'s Dotfiles
![Install Mac](https://github.com/mo-mo-666/dotfiles/workflows/Install%20on%20Mac/badge.svg)
![Install Linux Normal](https://github.com/mo-mo-666/dotfiles/workflows/Install%20on%20Linux%20Normal/badge.svg)
![Install Linuxbrew](https://github.com/mo-mo-666/dotfiles/workflows/Install%20on%20Linuxbrew/badge.svg)
![Install on Windows](https://github.com/mo-mo-666/dotfiles/workflows/Install%20on%20Windows/badge.svg)

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

## Windowsについて

Windows は現時点で，Chocolatey によるインストールのみ対応している。
`Chocofile.config` のみを適切な位置に配置し，管理者権限の PowerShell で以下を実行。
```powershell
# See chocolatey official web site.
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
cd <path to the directory of Chocofile.config>
choco install -y Chocofile.config
```

メモ： [インストール時に --ignore-checksums オプションを付けないとうまくいかないものがある。](https://www.gep13.co.uk/blog/chocolatey-error-hashes-do-not-match)
