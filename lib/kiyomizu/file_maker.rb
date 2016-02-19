require "csv"

module Kiyomizu
  module FileMaker

    # csvファイルを出力
    def create_csv(array)
      headers = %w(名前 住所 TEL FAX)
      data = CSV.generate('', write_headers: true, headers: headers) { |csv|
        array.each do |info|
          csv << info
        end
      }
      file_name = "#{Dir.pwd}/outputs/#{self.name}_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
      open(file_name, "a") do |file|
        file.puts data
      end
    end
  end
end
