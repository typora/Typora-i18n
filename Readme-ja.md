# Typoraの翻訳

Typoraを翻訳してくださる全ての方々に深く感謝します.

### 既存の翻訳を改善する

- このプロジェクトをフォークし、テキストを変更後にプルリクエストを作成してください

#### 翻訳が不足しているラベルを見つける

Typoraが更新されたとき、新しいテキストラベルが `Base.lproj` 以下の `.strings` ファイルに追加されます. 以下のコマンドで `{locale}.lproj` 以下の不足しているキーを見つけることができます. ([@BrainCrumbz](https://github.com/BrainCrumbz)に感謝します) 例えば `it-IT.lproj/Welcome.strings` の場合:

```shell
gawk 'BEGIN { FS=" = " } { print $1 }' Base.lproj/Welcome.strings > base-keys
gawk 'BEGIN { FS=" = " } { print $1 }' it-IT.lproj/Welcome.strings > it-keys
```

#### Find translation progress and all missing labels

[@Hayao0819](https://github.com/Hayao0819)が未翻訳のラベルと翻訳の進捗を表示するスクリプト <https://github.com/typora/Typora-i18n/blob/master/tools.sh> を作成しました. [#382](https://github.com/typora/Typora-i18n/issues/382) で詳細を確認できます.

### 新しい言語を追加する

1. 現在のissueリストを確認して, 他の誰かがあなたの言語へ翻訳を行っていないかどうか確認します. もし誰も行っていなければ新しいissueを作成し, 他の人に自分が翻訳を行っていることを伝えてください. (同じ作業を複数人が行わないようにします.)
2. リポジトリをフォークしてください.
3. `{locale}.lproj`というフォルダを作成してください, `local` コードは必ず [locale-identifiers.csv](locale-identifiers.csv) から選択してください.
4. `*.strings`ファイルを `Base.lproj` から `{locale}.lproj`にコピーしてください.
5. お好みのエディタで`*.strings` を開き, 翻訳を行ってください. 翻訳ルールも参照してください.
6. プルリクエストを作成してください.
7. 翻訳後, issueもしくは `*.strings` ファイルの中にメールアドレスのような連絡手段を教えていただけると非常に嬉しいです. 私達が連絡を取り, Beta終了後にお礼として無料のライセンスをお渡しします. メールアドレスをGitHubに公開したくない場合は私達に個別に教えて下さい.

### 翻訳ルール

- `Menu.strings` の翻訳は必ず <https://github.com/martnst/localize-mainmenu> に従ってください.
- <https://github.com/martnst/localize-mainmenu> に従う翻訳がWindows/Linuxで適切でない場合は, `Menu-electron.strings`に適切なものを追加してください. (zh-Hans.lproj に一例があります).
  - Microsoft's Terminology Search  <[https://www.microsoft.com/en-us/language](https://learn.microsoft.com/en-us/globalization/reference/microsoft-terminology)> を用いてWindows の単語の翻訳を検索できます. <https://www.microsoft.com/en-us/language/Toolbox> ではその他の便利な翻訳リソースにアクセスできます.
- `/* some words */`形式のコメントがサポートされています. `// comment` はサポートされていません.

## FAQ

> 翻訳をテストできますか?

申し訳ありませんが、現在テストは行えません. 原文のコンテキストや翻訳に関する疑問がございましたら私達に連絡してください.

## Contact

ぜひ <hi@typora.io> へご連絡ください.

## 参考

- macOSにおけるMenu items → <https://github.com/martnst/localize-mainmenu>
- Windowsに関する用語 → <https://learn.microsoft.com/en-us/globalization/reference/microsoft-terminology>

## 他の言語

[English](Readme.md)
[简体中文](Readme-zh.md)

## 貢献者

[貢献者](Readme.md#Credits)
