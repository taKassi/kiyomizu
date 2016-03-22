require "csv"

module Kiyomizu
  module OperateFile

    # csvファイルを出力
    def create_csv(array, original_name = "")
      data = CSV.generate('', write_headers: false) { |csv|
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

    # Excelデータを扱いやすいように配列へ
    def self.organize_excel(flie_name)
      open("#{Dir.pwd}/inputs/#{flie_name}",
                                "rb:Shift_JIS:UTF-8", undef: :replace) do |data|
        excel_array = []
        CSV.new(data).each do |row|
          excel_array << row
        end
        excel_array
      end
    end
  end
end
