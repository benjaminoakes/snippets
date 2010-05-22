# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'csv'
require 'date'

File.open('/home/ben/tmp/csv_writer.csv', 'w') do |file|
  CSV::Writer.generate(file) do |csv|
    csv << ['a', 'b', 1, nil, "Lines abound!\nWow, 2 whole lines!\nYipee!", Date.today]
  end
end

