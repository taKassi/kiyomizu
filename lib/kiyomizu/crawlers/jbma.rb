require "nokogiri"
require "open-uri"

module Kiyomizu
  module Crawlers
    class JBma

      def initialize
        @name = "Bill Maintenance"
      end
      # あいさつしよう
      def greet
        "Hello! This crawler is #{@name}!!"
      end

      # SiteからHTMLを抽出してファイルへ
      def create_base_file(url)
        doc = Nokogiri::HTML(open(url))
        file_name ="#{Dir.pwd}/htmls/#{time.now.strftime('%Y%m%d%H%M%S')}.txt"
        open(file_name, "w") do |file|
          file.puts doc
        end
      end

      #
      def scrape(url_or_file_path)
        doc = Nokogiri::HTML(open(url_or_file_path))

        infomation = []
        doc.css('div.box').each do |node|
          info = []

          # 名前の抽出
          names = node.css('div.name').text
          info <<
          names.gsub(/所属協会.+/, "").gsub(" ", "").gsub("\n", "").gsub("\r", "")
          # 所属の抽出
          info << node.css('div.associ').text
          # 住所を抽出
          address = node.text.match(/.{2,3}[都道府県].+\d/)
          info << address[0]
          # TELの抽出
          tel = node.text.match(/^TEL:.+/)
          info << tel[0].gsub("TEL:", "").gsub("\r", "")
          #FAXの抽出
          fax = node.text.match(/^FAX:.+/)
          info << fax[0].gsub("FAX:", "").gsub("\r", "")

          # 抽出した要素の配列をはinofmationへpush
          infomation << info
        end
        infomation
      end
    end
  end
  
end
