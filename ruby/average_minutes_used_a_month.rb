# Parse and report stats on phone usage for my old Treo 650.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'

File.open('/Users/ben/Outbox/TreCallLog Export.txt', 'r') do |file|
  lines = file.readlines.first.split(/\r/)
  
  descriptor = lines.shift.split(/\t/).map { |description| description.gsub(/\s+/, '').downcase }
  puts("descriptor: #{descriptor.inspect}")
  
  minutes_used = 0
  current_month = nil
  results = {}
  
  lines.each do |line|
    fields = line.split(/\t/)
    
    minutes_used_string = fields[descriptor.index('minutes')]
    seconds_used = (minutes_used_string.split(':')[0].to_i * 60) + minutes_used_string.split(':')[1].to_i
    
    current_month = Date.parse(fields[descriptor.index('date')]).strftime('%B %Y')
    
    results[current_month] = if results[current_month].nil?
      seconds_used
    else
      results[current_month] + seconds_used
    end
  end
  
  results.keys.each do |key|
    puts "#{key}: #{results[key] / 60}"
  end
end
