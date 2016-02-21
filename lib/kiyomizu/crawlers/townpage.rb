require "anemone"
require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class TownPage < Kiyomizu::Crawlers::Common

      # Kiyomizu::Crawlers::Common#create_base_fileをオーバーライド

      def create_base_file(url)
        doc = Nokogiri::HTML(open(url))

        open(self.scraped_file_name, "a") do |file|
          file.puts doc
        end
      end

      # ソースコードの解析して配列をかえす
      def scrape(file_name)
        doc = Nokogiri::HTML(open("#{Dir.pwd}/htmls/#{file_name}"))

        # 名前の抽出し
        names = doc.css('h4.clearfix').text.gsub("クーポン", "").gsub(" ", "").gsub("\r", "").split("\n")
        names.map! do |name|
          unless name == ""
            name
          end
        end

        names.compact!

        # secitonの抽出
        sections = doc.css('section').text
        sections = sections.split('住所')

        sections.map! { | section |
          section.strip.gsub(" ", "").gsub("\r", '').gsub("\n", "")
        }

        sections.map! do |section|
          section.match(/(東京都.+)TEL(.+?\d+(-|\d)\d+(-\d+))/)
        end

        sections.delete_at(0)

        # sectionsか住所を抽出
        addresses = sections.map { |section|
                      section[1].gsub("地図・ナビ", "")
                     }

        #  sectionsからTEL情報を抽出
        tels = sections.map { |section|
          section[2].gsub("(代)", "")
         }

         names.zip(addresses, tels)
      end
    end
  end
end
