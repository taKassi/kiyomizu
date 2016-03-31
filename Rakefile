require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"
require "kiyomizu"

# 作成物ファイルの削除
CLEAN.include('htmls/*.txt')
CLEAN.include('inputs/*.csv')
CLEAN.include('outputs/*.csv')
CLEAN.include('outputs/done/*.csv')

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
  crawler = Kiyomizu.townpage

  desc 'URLの配列チェック'
  task :cheack do
    puts TOWNPAGE_URLS
  end

  desc 'タウンページのHTMLをコピー'
  task :copy do
    # 使用例 豊洲
    # crawler.get_urls(11.0, "13108/13108030", "public")

    if TOWNPAGE_URLS.empty?
      puts "lib/kiyomizu.rbでURLを設定する必要あり。"
    else
      crawler.copy_sorce(TOWNPAGE_URLS)
    end
  end

  desc 'タウンページの解析と抽出してcsvファイルを作成'
  task :scrape do
    puts "#{ARGV[1]}から抽出します"
    info = crawler.scrape(ARGV[1])
    crawler.create_csv(info)
  end
end
