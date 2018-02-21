require 'csv'
require 'pry'

module FileOperations
  class CSVFile
    def self.write_to(filename, input, mode="a+")
      CSV.open(filename, mode){ |csv| csv << [input] }
    rescue StandardError => error
      puts error
    end

    def self.read_from(filename)
      CSV.read(filename)
    rescue StandardError => error
      puts error
    end
  end
end
