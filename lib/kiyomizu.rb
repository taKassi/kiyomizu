require "kiyomizu/crawlers/jbma"
require "kiyomizu/crawlers/townpage"
require "kiyomizu/operate_file"
require "kiyomizu/version"

module Kiyomizu
  # OperateFile Moduleの取り来み
  include Kiyomizu::OperateFile

  # jbma用のインスタンスを作成
  def self.jbma
    Kiyomizu::Crawlers::JBma.new
  end

  # townpage用のインスタンスを作成
  def self.townpage
    Kiyomizu::Crawlers::TownPage.new
  end
end
