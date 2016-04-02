require "kiyomizu/crawlers/common"

module Kiyomizu
  module Crawlers
    class JBma < Kiyomizu::Crawlers::Common

      attr_reader :url

      def initalize
        super
        @url = 'http://www.j-bma.or.jp/meibo/corp.php'
      end

      # ソースコードの解析
      def scrape(file_name_in_htmls_derectory)
        doc = Nokogiri::HTML(open("#{Dir.pwd}/htmls/#{file_name_in_htmls_derectory}"))

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
