require "nokogiri"
require "open-uri"
require "kiyomizu/operate_file"

module Kiyomizu
  module Crawlers
    class Common
      attr_reader :name, :scraped_file_name

      include Kiyomizu::OperateFile

      def initialize
        @name = self.class.to_s.scan(/\w+$/)[0]
        @scraped_file_name =
          "#{Dir.pwd}/htmls/#{self.name}_#{Time.now.strftime('%Y%m%d%H%M%S')}.txt"
      end
      # ごあいさつ
      def greet
        "Hello! this crawler is #{@name}!!"
      end

      # SiteからHTMLを抽出してファイルへ
      def copy_sorce(url)
        doc = Nokogiri::HTML(open(url))

        open(self.scraped_file_name, "w") do |file|
          file.puts doc
        end
      end

      def scrape
        puts "Scrape by #{@name}"
      end
    end
  end
end
