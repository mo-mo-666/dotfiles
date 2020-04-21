# dotfiles
![Install Mac](https://github.com/mo-mo-666/dotfiles/workflows/Install%20Mac/badge.svg)
![Install Linux Normal](https://github.com/mo-mo-666/dotfiles/workflows/Install%20Linux%20Normal/badge.svg)
![Install Linuxbrew](https://github.com/mo-mo-666/dotfiles/workflows/Install%20Linuxbrew/badge.svg)

Deploy and Initialize for Mac, Linux(Ubuntu), and WSL(Ubuntu).

## 用語

#### deploy
dotfiles にリンクを張ること。`dotfiles.sh` に対応。

#### initialize
インストール・初期設定すべて行うこと。`install.sh` に対応。

## インストール
```bash
cd ~
git clone https://github.com/mo-mo-666/dotfiles.git
cd dotfiles
```

#### 注意
**このリポジトリは ${HOME}直下におかれることを想定しています。**

## ディレクトリ構成

#### `_dotfiles/`
各マシン共通で使う dotfile を置く場所。

#### `dotfiles/`
個々のマシン独自の設定をする dotfile を置く場所。`_dotfiles` より優先的に読み込まれる。
Git の管理外になる。

#### `backup/`
`dotfiles.sh` を強制実行したときに，もともとあった dotfiles のバックアップをとる場所。
Git の管理外になる。

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

## initialize.sh

デプロイからライブラリのインストール・初期設定まですべて行う。

- Mac のとき

```bash
./initialize.sh mac
```

- Linux or WSL (Ubuntu) + 標準インストールのとき

```bash
./initialize.sh linux_normal
```

- Linux or WSL (Ubuntu) + Linuxbrew のとき

```bash
./initialize.sh linuxbrew
```

内部でも OS 判定を行っているので，それと一致していないとエラーになる。
