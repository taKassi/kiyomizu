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
crawler = Kiyomizu.XXXXXXX_crawler
```
対応したクローラーのインスタンス生成。
### クローラー
- Kiyomizu.j_bma_crawler

### クラスメッソド
```ruby
Kiyomizu.create_csv
```
csvファイルの生成

## Contributing

1. Fork it ( https://github.com/[my-github-username]/kiyomizu/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
