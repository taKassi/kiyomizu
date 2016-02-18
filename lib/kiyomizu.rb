require "kiyomizu/crawlers/jbma"
require "kiyomizu/file_maker"
require "kiyomizu/version"

module Kiyomizu
  # FileMaker Moduleの取り来み
  include FileMaker

  # j_bma用のインスタンスを作成
  def self.jbma_crawler
    Crawlers::JBma.new
  end
end
