# Kiyomizu

プライベート用クローラー

## Usage
### Rakeファイルでタスク可している。
詳細は"rake -T"でタスクを確認。  
基本的にはRakeのみでクローリングを行う感じ。

### Kiyomizuクラスについて
```ruby
# 使用するクローラーのインスタンス作成
crawler = Kiyomizu.jbma
crawler = Kiyomizu.townpage

# 対象サイトのHTMLソースコードをファイルへ保存
crawler.copy_sorce('対象のURL')

# ファイルを解析し要素を抽出
crawler.scrape('#copy_sorceで作成したhtmlsフォルダ内のファイル名')

# CSVファイルを出力
crawler.create_csv('csvにしたい配列')

```

## Kiyomizu::OperateFileモジュール
ファイル操作を行う

```ruby
# エクセルファイルから作成したcsvファイルから配列を戻す
# ※ エクセルからcsvに変換することは事前に必要。
Kiyomizu::OperateFile.organize_excel
```
