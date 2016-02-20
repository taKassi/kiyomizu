require "anemone"
require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class TownPage < Kiyomizu::Crawlers::Common

      # Kiyomizu::Crawlers::Common#create_base_fileをオーバーライド

      def create_base_file(urls)
        options = { depth_limint: 0,
                    skip_query_string: true,
                    delay: 1 }

        Anemone.crawl(urls, options) do |anemone|
          anemone.on_every_page do |page|
            doc = Nokogiri::HTML(page.body)


            open(self.scraped_file_name, "a") do |file|
              file.puts doc
            end
          end
        end
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
