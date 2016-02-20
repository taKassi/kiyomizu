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

      # ソースコードの解析
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
        section = doc.css('section').text
        section = section.split('住所')

        section.map! { | fact |
          fact.strip.gsub(" ", "").gsub("\r", '').gsub("\n", "")
        }

        section.map! do |fact|
          match = fact.match(/(東京都.+)TEL(.+?\d+(-|\d)\d+(-\d+))/)
        end

        section.delete_at(0)
        p section






        # 住所を抽出
        # addresses = doc.xpath('//*[@id="wrapAllInside"]/div/div[2]/div/div[2]/div/article/section/p[2]').text
        # addresses = addresses.split('住所')
        # addresses.delete_at(0)
        #
        # addresses.map! do |address|
        #   match = /(東京都.+)(地図.+)/.match(address)
        #   match[1]
        # end
        #
        # # TELの抽出
        # tels = doc.xpath('//*[@id="wrapAllInside"]/div/div[2]/div/div[2]/div/article/section/p').text
        # tels = tels.split('TEL')
        # p tels


        # FAXの抽出

        # 抽出した要素の配列をはinofmationへpush
        # infomation << info
        # infomation
      end
    end
  end
end
