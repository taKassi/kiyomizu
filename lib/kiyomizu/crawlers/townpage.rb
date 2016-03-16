require "anemone"
require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class TownPage < Kiyomizu::Crawlers::Common

      # Kiyomizu::Crawlers::Common#copy_sorceをオーバーライド

      def copy_sorce(urls)
        options = { depth_limit: 0,
                    skip_query_string: true,
                    delay: 1 }

        Anemone::crawl(urls, options) do |anemone|
          anemone.on_every_page do |page|
            doc = Nokogiri::HTML.parse(page.body)

            open(self.scraped_file_name, "a") do |file|
              file.puts doc
            end

            puts "#{page.url}をコピー"
          end
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
          section.match(/(.+都.+|.+道.+|.+府.+|.+県.+)TEL(.+?\d+(-|\d)\d+(-\d+))/)
        end

        sections.compact!

        # sectionsか住所を抽出
        # 住所のベースを抽出
        addresses = sections.map { |section|
                      section[1].gsub("地図・ナビ", "")
                     }

        post_numbers = []
        districts    = []
        others       = []
        addresses.map do |address|
          address = address.match(/(^〒\d+-\d+)\S東京都(.+区)(.+$)/)
          # 郵便番号抽出
          post_numbers << address[1]
          # 市町村区抽出
          districts << address[2]
          # その他
          others << address[3]
        end

        #  sectionsからTEL情報を抽出
        tels = sections.map { |section|
          section[2].gsub("(代)", "")
         }

         info = names.zip(post_numbers, districts, others, tels).uniq
         info = info.delete_if  { |factor| factor[2] == nil }
      end
    end
  end
end
