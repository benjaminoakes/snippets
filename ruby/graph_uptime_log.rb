# I don't think this ever worked...
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require "rubygems"
require "ruport"

require "ruport/util"

class GraphReport < Ruport::Report 
  renders_as_graph

  def renderable_data(format)
    graph = Graph(%w[a b c d e])
    graph.series [1,2,3,4,5], "foo" 
    graph.series [11,22,70,2,19], "bar"
    return graph
  end
end                                

GraphReport.generate do |r| 
  # puts r.methods.sort
  # r.save_as("foo.svg", :template => :graph)
  # puts r.as(:csv)
end

