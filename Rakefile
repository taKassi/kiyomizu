require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"
require "kiyomizu"

# jbmaのURL
JBMA_URL = 'http://www.j-bma.or.jp/meibo/corp.php'

# TownPageのURL
TOWNPAGE_URLS = []

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
  crawler = Kiyomizu.townpage

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
