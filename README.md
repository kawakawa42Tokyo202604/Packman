# Packman

## English

A Pac-Man game in Python. Move through generated mazes, collect dots, avoid four ghosts, and keep a top-ten score table. The game includes at least ten levels, pause controls, and an evaluation cheat mode.

### Layout

| Path | Contents |
| --- | --- |
| `src/` | Movement, ghosts, scores, configuration, and pygame screens |
| `assets/` | Normal and horror-mode sprites |
| `package/` | The external team’s maze generator |
| `tests/` | Game rules, menus, scores, and resource checks |
| `management/` | Planning and review records |

### Run and test

Requires Python 3.12+, uv, and Make. Run from the repository root.

```sh
make install
make run
make test
make package
```

Move with arrow keys or WASD. `make test` prepares a cached environment and runs 83 tests using dummy video and audio drivers, so no desktop is required. Packaging and publishing a build on Itch.io are separate steps.

See [the detailed guide](docs/GUIDE.md) for the original setup and implementation notes.

## 日本語

Pythonで作ったパックマンゲームです。生成された迷路を移動して点を集め、4体のゴーストを避けます。10面以上のレベル、ポーズ操作、上位10件のスコア保存、評価用のチートモードを備えています。

### 構成

| パス | 内容 |
| --- | --- |
| `src/` | 移動・ゴースト・スコア・設定・pygame画面 |
| `assets/` | 通常版とホラー版の画像 |
| `package/` | 別チームの迷路生成器 |
| `tests/` | ゲーム規則・画面遷移・スコア・素材の検証 |
| `management/` | 計画とレビューの記録 |

### 実行とテスト

Python 3.12以降・uv・Makeが必要です。 リポジトリ直下で実行します。

```sh
make install
make run
make test
make package
```

矢印キーかWASDで移動します。`make test` はキャッシュ上に環境を用意し、仮想画面・音声ドライバで83テストを実行するためデスクトップは不要です。配布物の作成とItch.ioへの公開は別途行います。

元の構築手順と設計の説明は[詳細ガイド](docs/GUIDE.md)にまとめています。
