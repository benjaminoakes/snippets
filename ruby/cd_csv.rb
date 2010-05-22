# Author: Benjamin Oakes <hello@benjaminoakes.com>

# Possible cool idea: use an OStruct instead.
CD = Struct.new(:upc, :title, :price)

File.open(ARGV[0]) do |file|
  cds = []
  
  while line = file.gets
    upc, title, price = line.chomp.split(", ")
    cds << CD.new(upc, title, price.to_f)
  end
  
  cds = cds.sort_by {|cd| cd.price}
  
  total_value = 0.0
  
  cds.each do |cd|
    puts "#{cd.upc}, #{cd.title}, #{cd.price}"
    total_value += cd.price
  end
  
  puts("total_value: #{total_value.inspect}")
end

