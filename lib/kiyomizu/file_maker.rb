require "csv"

module FileMaker

  # csvファイルを出力
  def self.create_csv(array, title = "create_at")
    headers = %w(名前 所属 住所 TEL FAX)
    data = CSV.generate('', write_headers: true, headers: headers) { |csv|
      array.each do |info|
        csv << info
      end
    }
    file_name = "#{Dir.pwd}/outputs/#{title}_#{Time.now.strftime('%Y%m%d%H%M%S')}.csv"
    open(file_name, "a") do |file|
      file.puts data
    end
  end
end
