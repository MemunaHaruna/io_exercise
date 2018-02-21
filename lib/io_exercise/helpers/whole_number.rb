require 'prime'
require 'pry'

module WholeNumber
  class Integer
    def self.generate(range = 1..1000)
      range.to_a
    end
  end

  class PrimeNumber
    def initialize(number)
      @number = number
    end

    def is_prime?
      Prime.prime?(@number)
    rescue StandardError => error
      puts error
    end
  end
end
