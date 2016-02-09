require "kiyomizu/version"
require "nokogiri"
require "open-uri"
require "csv"

module Kiyomizu

  # あいさつしよう
  def self.greet
    'Hello! My name is "Kiyomizu".'
  end

  # SiteからHTMLを抽出してファイルへ
  def self.create_base_file(url)
    doc = Nokogiri::HTML(open(url))
    file_name ="#{Dir.pwd}/htmls/document.txt"
    open(file_name, "w") do |file|
      file.puts doc
    end
  end

  #
  def self.scrape(url)
    doc = Nokogiri::HTML(open(url))

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

  def self.create_csv(array)
    headers = %w(名前 所属 住所 TEL FAX)
    data = CSV.generate('', write_headers: true, headers: headers) { |csv|
      array.each do |info|
        csv << info
      end
    }
    time_now = Time.now.strftime('%Y%m%d%H%M%S')
    file_name = "#{Dir.pwd}/outputs/#{time_now}.csv"
    open(file_name, "a") do |file|
      file.puts data
    end
  end
end
