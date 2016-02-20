require "anemone"
require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class TownPage < Kiyomizu::Crawlers::Common

      # Kiyomizu::Crawlers::Common#create_base_fileをオーバーライド

      def create_base_file
        puts '#create_base_file使用不可 #scrapeを使用すること'
      end

      # ソースコードの解析
      def scrape(file_name_in_htmls_derectory)
        doc = Nokogiri::HTML(open("#{Dir.pwd}/htmls/#{file_name_in_htmls_derectory}"))

        infomation = []
        doc.css().each do |node|
          info = []

          # 名前の抽出

          # 住所を抽出

          # TELの抽出

          # FAXの抽出

          # 抽出した要素の配列をはinofmationへpush
          infomation << info
        end
        infomation
      end
    end
  end
end
