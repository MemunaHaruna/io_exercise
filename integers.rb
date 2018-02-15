require 'csv'

def generate_numbers
  CSV.open("./output/integers.csv", "wb") do |csv|
    (1..1000).each do |number|
      csv << [number]
    end
  end
end

generate_numbers
