require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"
require "kiyomizu"

# 作成物ファイルの削除
CLEAN.include('htmls/*.txt')
CLEAN.include('inputs/*.csv')
CLEAN.include('outputs/done/*.csv')

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end

task :default => :test

# jbma用クローラー
namespace :jbma do
  crawler = Kiyomizu.jbma

  desc 'jbmaのHTMLをコピー'
  task :copy do
    crawler.copy_sorce(crawler.url)
    puts "#{crawler.url}をコピーしました"
  end

  desc 'jbmaの解析と抽出してcsvファイルを作成'
  task :scrape do
    puts "#{ARGV[1]}から抽出します"
    info = crawler.scrape(ARGV[1])
    crawler.create_csv(info)
  end
end

# TownPage用クローラー
namespace :townpage do
  crawler = Kiyomizu.townpage
  # ジャンルをself.genreに設定
  # crawler.genre = "beauty"
  # URLを#get_urlsメソッドで配列に格納
  # crawler.get_urls(34.0, "13108/13108042", crawler.genre)

  desc 'URLの配列チェック'
  task :check do
    puts crawler.urls
    puts crawler.genre
  end

  desc 'タウンページのHTMLをコピー'
  task :copy do
    if crawler.urls.empty? || crawler.genre.empty?
      puts "対象のurlとジャンルをRakefilのtownpageブロック内で設定する必要があります。"
    else
      crawler.copy_sorce
    end
  end

  desc 'タウンページの解析と抽出してcsvファイルを作成'
  task :scrape do
    puts "#{ARGV[1]}から抽出します"
    info = crawler.scrape(ARGV[1])
    crawler.create_csv(info, crawler.genre)
    puts "#{crawler.genre}をファイル名に追記しました"
  end
end
