require "csv"

module Kiyomizu
  module OperateFile

    # csvファイルを出力
    def create_csv(array, genre = "")
      data = CSV.generate('', write_headers: false) { |csv|
        array.each do |info|
          info << genre
          csv << info
        end
      }
      file_name = "#{Dir.pwd}/outputs/#{self.name}-#{genre}" +
                                    "_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
      open(file_name, "a") do |file|
        file.puts data
      end
    end

    # Excelデータを扱いやすいように配列へ
    def organize_duplicate(file_name)
      open("#{Dir.pwd}/inputs/#{file_name}",
                                "rb:Shift_JIS:UTF-8", undef: :replace) do |data|
        excel_array = []
        CSV.new(data).each do |row|
          excel_array << row
        end
        excel_array
      end
    end

    def add_genre(file_pass, genru = "")
      file_name = "#{Dir.pwd}/#{file_pass}"
      csv = CSV.read(file_name, encoding: 'UTF-8')

      csv.map! { |row|
        row << genru
        row
      }

      create_csv(csv, genru)
    end
  end
end
