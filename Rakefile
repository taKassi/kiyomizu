require "bundler/gem_tasks"
require "rake/testtask"
require "rake/clean"

# 作成物ファイルの削除
CLEAN.include('htmls/*.txt')
CLEAN.include('outputs/*.csv')

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
end

task :default => :test
