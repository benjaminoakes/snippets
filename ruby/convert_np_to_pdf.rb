# This never worked quite right.
# 
# I was starting to download Nintendo Power (the old ones I remember from being a kid) from RetroMags.com and turn them into PDFs.
#
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'rubygems'

# require 'find'
require 'fileutils'
require 'pdf/writer'

TEMP_DIR = '/tmp/np_converter'
FileUtils.mkdir_p(TEMP_DIR)

Dir.glob("/Users/ben/Downloads/np/*.cbr").each do |path|
  puts "-" * 80
  puts("path: #{path.inspect}")
  basename = File.basename(path, '.cbr')
  puts("basename: #{basename.inspect}")
  volume = basename.match(/nintendo_power_(\d\d\d)/)[1]
  puts("volume: #{volume.inspect}")
  year = basename.match(/nintendo_power.*?-_(\d\d\d\d)/)[1]
  puts("year: #{year.inspect}")
  month = basename.match(/(.{3})$/)[1]
  puts("month: #{month.inspect}")
  pdf_name = "#{volume} - #{month.capitalize} #{year}"
  puts("pdf_name: #{pdf_name.inspect}")
  
  # puts "Unzipping..."
  # %x[unzip -d #{TEMP_DIR} #{path}]
  
  pdf = PDF::Writer.new
  puts pdf.methods.grep(/margin/).sort
  pdf.margins_in(0, 0, 0, 0)
  # pdf.page_mode = FullScreen
  
  Dir.glob("#{TEMP_DIR}/#{basename}/*.jpg").each do |page_path|
    puts("page_path: #{page_path.inspect}")
    pdf.image page_path #, :resize => :width
  end
  
  pdf.save_as("/Users/ben/Desktop/#{pdf_name}.pdf")
  
  # %x[automator -i #{page_paths.join(" ")} img_to_pdf.workflow]
  # %x[rm -f #{TEMP_DIR}
end
