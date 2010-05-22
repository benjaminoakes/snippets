#!/usr/bin/env ruby
# SQLite3 to CSV in Ruby.
# 
# If that's all you want, you can also use:
# 
#     .mode csv
# 
# when using SQLite3.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'csv'
require 'stringio'

require 'rubygems'
require 'sqlite3'

def select_all_from(table_name)
  database = SQLite3::Database.new(File.expand_path('~/Outbox/output_notest.sqlite3'))

  rows = []

  database.execute('select * from ' + table_name) do |row|
    rows << row
  end
  
  return rows
end

csv_io = StringIO.new('')

CSV::Writer.generate(csv_io) do |csv|
  select_all_from('my_table').each do |row|
    csv << row
  end
end

csv_io.rewind
puts csv_io.readlines

