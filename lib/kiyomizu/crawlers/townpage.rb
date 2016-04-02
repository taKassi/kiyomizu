require "anemone"
require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class TownPage < Kiyomizu::Crawlers::Common

      attr_accessor :urls, :genre

      def initialize
        super
        @urls  = []
        @genre = ""
      end

      # Kiyomizu::Crawlers::Common#copy_sorceをオーバーライド
      def copy_sorce(urls = self.urls)
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
        names = doc.css('h4.clearfix').text.gsub("クーポン", "").gsub(" ", "").gsub("\r", "").gsub("複数掲載あり", "").split("\n")
        names.map! do |name|
          unless name == ""
            name
          end
        end

        names.compact!

        # secitonの抽出
        sections = doc.css('section').text
        sections = sections.split("住所")
        sections.delete_at(0)
        #
        sections.map! { | section |
          section.strip.gsub(" ", "").gsub("\r", '').gsub("\n", "")
        }

        sections.map! do |section|
          section.match(/(.+都.+|.+道.+|.+府.+|.+県.+)TEL(.+?\d+(-|\d)\d+(-\d+))/)
        end
        #
        # # sections.compact!

        # sectionsから住所を抽出
        # 住所のベースを抽出
        addresses = sections.map { |section|
                      section.to_s.gsub("地図・ナビ", "").gsub("(代)", "")
                     }

        addresses.map! do |address|
          address.match(/(^〒\d+-\d+)\S東京都(.+区)(.+)TEL([\d|-]+$)/)
        end


        # 郵便番号の抽出
        post_numbers = []
        extract_to_elements(addresses, post_numbers, 1)

        # 市町村区の抽出
        districts    = []
        extract_to_elements(addresses, districts, 2)

        # その他の住所を抽出
        others = []
        extract_to_elements(addresses, others, 3)

        # Telの抽出
        tels = []
        extract_to_elements(addresses, tels, 4)

        info = names.zip(post_numbers, districts, others, tels).uniq

        info
      end

      # タウンぺージのURLを
      def get_urls(float_count, id, genre = self.genre)
        pages = float_count / 50
        pages = pages.ceil
        for i in 1..pages do
          self.urls << "http://itp.ne.jp/tokyo/#{id}/genre_dir/#{genre}/pg/#{i}/?sr=1&nad=1&num=50"
        end
      end
    end
  end
end

private

def extract_to_elements(match_datas, store_array, num)
  match_datas.each do |data|
    data.nil? ? store_array << "なし" : store_array << data[num]
  end
end
