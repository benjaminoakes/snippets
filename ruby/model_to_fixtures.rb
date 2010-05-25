# If you spend a lot of time doing data entry in your Rails app, why not serialize the data into fixtures so you can load it back in later?
# 
# Outputs to YAML to STDOUT.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'yaml'

# Example:
# 
#     model_to_fixtures(People, :all, :first_name)
# 
def model_to_fixtures(model_class, scope_symbol, name_method_symbol)
  fixtures = {}

  model_class.send(scope_symbol).each do |model|
    fixture_name = model.send(name_method_symbol)
    fixture_name = fixture_name.downcase.gsub(/[:punct:]/, '').gsub(/\s+/, '_')

    fixtures[fixture_name] = model.attributes
  end

  fixtures.keys.sort.each do |fixture_name|
    puts fixtures[fixture_name].to_yaml
  end
end

