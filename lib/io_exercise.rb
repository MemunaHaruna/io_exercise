require_relative './io_exercise/helpers/file_operations'
require_relative './io_exercise/helpers/whole_number'
require 'pry'
require 'csv'

module IOExercise
  class WriteIntegersToFile
    def initialize(filename, range)
      @filename = filename
      @integers = WholeNumber::Integer.generate(range)
    end

    def process
      @integers.each {|int| FileOperations::CSVFile.write_to(@filename, int) }
    end
  end


  class WritePrimeNumbersToFile
    def initialize(input_file, target_file)
      @numbers = FileOperations::CSVFile.read_from(input_file)
      @target_file = target_file
    end

    def process
      @numbers.each do |number|
        number = number[0].to_i
        FileOperations::CSVFile.write_to(@target_file, number) if WholeNumber::PrimeNumber.new(number).is_prime?
      end
    end
  end
end

integers_file_path =
'/Users/memuna/Desktop/ruby_code_personal/io_exercise/lib/io_exercise/output/integers.csv'

prime_file_path =
'/Users/memuna/Desktop/ruby_code_personal/io_exercise/lib/io_exercise/output/prime.csv'

IOExercise::WriteIntegersToFile.new(integers_file_path, (1..1000)).process
IOExercise::WritePrimeNumbersToFile.new(integers_file_path, prime_file_path).process
