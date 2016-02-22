# Kiyomizu

プライベート用クローラー

## Usage

### Rakeファイルで対応可能。
詳細は"rake -T"で!!


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
