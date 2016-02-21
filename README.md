# Kiyomizu

オリジナルクローラー

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'kiyomizu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kiyomizu

## Usage
```ruby

# 使用するクローラーのインスタンス作成
crawler = Kiyomizu.jbma
crawler = Kiyomizu.townpage

# 対象サイトのHTMLソースコードをファイルへ保存
crawler.copy_sorce

# ファイルを解析し要素を抽出
crawler.scrape

# CSVファイルを出力
crawler.create_csv


```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kiyomizu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
