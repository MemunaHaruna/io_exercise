require 'csv'
require 'pry'

def generate_primes
  CSV.open("./output/prime.csv", "wb") do |prime_csv|
    prime_csv << ["prime numbers between 1-1000"]

    CSV.foreach("./output/integers.csv") do |row|
      row = row[0].to_i
      if [row, 2**row % row].include? 2
        prime_csv << [row]
      else
        next
      end
    end
  end
end

generate_primes

# Other way I thought of is to read the entire integers.rb file and dump it in an array then
# loop through that array and generate a different array of prime numbers then
# finally, loop through the array of prime numbers and write to prime.rb

# But this way I actually implemented seems way cleaner and faster
