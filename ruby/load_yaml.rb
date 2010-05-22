# Author: Benjamin Oakes <hello@benjaminoakes.com>
require 'yaml'

CACHE_PATH = '/Users/ben/.foobar/'

config = {
  'courses' => {
    'acoustics' => '', 
    'audiometry' => '',
    'hearing_science' => '',
    'neuroscience' => '' 
  }
}

puts config.to_yaml

loaded_configuration = YAML.load(File.open(CACHE_PATH + 'config.yml'))

puts "loaded_configuration: #{loaded_configuration.inspect}"

