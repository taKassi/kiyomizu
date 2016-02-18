require "kiyomizu/crawlers/jbma"
require "kiyomizu/file_maker"
require "kiyomizu/version"

module Kiyomizu
  # FileMaker Moduleの取り来み
  include Kiyomizu::FileMaker

  # jbma用のインスタンスを作成
  def self.jbma
    Kiyomizu::Crawlers::JBma.new
  end
end
