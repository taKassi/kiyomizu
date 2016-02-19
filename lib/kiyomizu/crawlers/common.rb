require "nokogiri"
require "open-uri"
require "kiyomizu/file_maker"

module Kiyomizu
  module Crawlers
    class Common
      attr_reader :name

      include Kiyomizu::FileMaker

      def initialize
        @name = self.class.to_s.scan(/\w+$/)[0]
      end
      # ごあいさつ
      def greet
        "Hello! this crawler is #{@name}!!"
      end

      # SiteからHTMLを抽出してファイルへ
      def create_base_file(url)
        doc = Nokogiri::HTML(open(url))
        file_name ="#{Dir.pwd}/htmls/#{self.name}_#{Time.now.strftime('%Y%m%d%H%M%S')}.txt"
        open(file_name, "w") do |file|
          file.puts doc
        end
      end

      def scrape
        puts "Scrape by #{@name}"
      end
    end
  end
end
