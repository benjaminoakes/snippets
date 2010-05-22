# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'open-uri'
require 'yaml'

username = 'benjaminoakes'

response = open('http://github.com/api/v2/yaml/repos/show/' + username)
repositories = YAML::load(response)

puts "repositories: #{(repositories).inspect}"

