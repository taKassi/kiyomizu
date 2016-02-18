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
# 対応したクローラーのインスタンス生成。
crawler = Kiyomizu."crawler_name"

# クローラー達
# * Kiyomizu.j_bma
```

### クラスメッソド
```ruby
# csvファイルの生成
Kiyomizu.create_csv
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kiyomizu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
