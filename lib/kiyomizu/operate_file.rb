require "csv"

module Kiyomizu
  module OperateFile

    # csvファイルを出力
    def create_csv(array, original_name = "")
      headers = %w(名前 住所 TEL FAX)
      data = CSV.generate('', write_headers: true, headers: headers) { |csv|
        array.each do |info|
          csv << info
        end
      }
      file_name = "#{Dir.pwd}/outputs/#{self.name}-#{original_name}" +
                                    "_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
      open(file_name, "a") do |file|
        file.puts data
      end
    end

    # csvデータの整理整頓
    def organize(file_name)
      open("#{Dir.pwd}/inputs/#{file_name}", "r") do |file|
        puts file
      end
    end

  end
end
