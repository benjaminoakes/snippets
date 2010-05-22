# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'yaml'

File.open(ARGV[0]) do |file|
  hash = YAML.load(file)
  
  hash.each do |fixture_name, value|
    # puts("fixture_name: #{fixture_name.inspect}")
    # puts("value: #{value.inspect}")
    # value['']
  end
end
