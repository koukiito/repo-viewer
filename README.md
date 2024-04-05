# repo-viewer

## アーキテクチャ

MVVM + Repository

## 実行方法

1. パッケージの取得
    以下を実行してパッケージを取得します。

    ```sh
    flutter pub get
    ```

1. 必要なファイルの生成
    freezed, riverpod_generator, flutter_localization等を用いて生成されるファイルはコミットされていません。以下を実行して生成してください。

    ```sh
    flutter gen-l10n
    ```

    ```sh
    dart run build_runner build --delete-conflicting-outputs
    ```

1. 実行
    以下で実行します。

    ```sh
    flutter run
    ```
 
## ディレクトリ構造
/app Flutterのルートディレクトリ

/app/lib/data/model/ # Model  
/app/lib/data/remote/ # Remote Data Source  
/app/lib/data/repository/ # Reposiroty  

/app/lib/ui/route/ # Route定義  
/app/lib/ui/search_repositories/ # 検索画面関係(View, ViewModel, State)  
/app/lib/ui/search_repository_detail/ # 詳細画面関係 (View)  
/app/lib/ui/settings/ # 設定画面関連 (View)  

/app/lib/l10n/ # .arbファイル等  

## 環境

- flutter 3.19.5
- Android MinSDK Version = 21 (Due to flutter_localization)

## lint, analyze

```sh
dart format --set-exit-if-changed $(find ./lib ./test -name "*.dart" -not \( -name "*.*freezed.dart" -o -name "*.*g.dart" \) )
```
([参考](https://starhoshi.hatenablog.com/entry/2023/05/19/172447))

```sh
dart fix --apply lib
```

```sh
dart fix --apply test
```

```sh
dart analyze
```

## AI利用等

GitHub Copilotを使用しています。