require 'rubygems'
require 'factory_girl'
require 'active_record'

# Factory.define :model do |m|
# 
# end

Factory.define :model, :class => ActiveRecord::Base do |m|
  m.bar 0
end

stub = Factory.stub(:model)

