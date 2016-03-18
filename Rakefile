require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"
require "kiyomizu"

# 作成物ファイルの削除
CLEAN.include('htmls/*.txt')
CLEAN.include('outputs/*.csv')
CLEAN.include('inputs/*.csv')

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end

task :default => :test

# jbma用クローラー
namespace :jbma do
  JBMA_URL = 'http://www.j-bma.or.jp/meibo/corp.php'
  crawler = Kiyomizu.jbma

  desc 'jbmaのHTMLをコピー'
  task :copy do
    crawler.copy_sorce(JBMA_URL)
    puts "#{JBMA_URL}をコピーしました"
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
  # TownPageのURL
  TOWNPAGE_URLS = []
  for i in 1..5 do
    TOWNPAGE_URLS << "http://itp.ne.jp/result/?kw=%95%B6%8B%9E%8B%E6%91%E5%92%CB%82%52%92%9A%96%DA&dcad=13&sr=1&evdc=1&num=50&pg=#{i}"
  end
  crawler = Kiyomizu.townpage

  desc 'URLの配列チェック'
  task :cheack do
    puts TOWNPAGE_URLS
  end

  desc 'タウンページのHTMLをコピー'
  task :copy do
    crawler.copy_sorce(TOWNPAGE_URLS)
  end

  desc 'タウンページの解析と抽出してcsvファイルを作成'
  task :scrape do
    puts "#{ARGV[1]}から抽出します"
    info = crawler.scrape(ARGV[1])
    crawler.create_csv(info)
  end
end
