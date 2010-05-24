# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'test/unit'

class Object
  # Find every subclass of an object. Limit the query to direct descendants by setting direct to true.
  # 
  # From: http://snippets.dzone.com/posts/show/2992
  def self.subclasses(direct = false)
    classes = []

    if direct
      ObjectSpace.each_object(Class) do |c|
        next unless c.superclass == self
        classes << c
      end
    else
      ObjectSpace.each_object(Class) do |c|
        next unless c.ancestors.include?(self) and (c != self)
        classes << c
      end
    end

    return classes
  end
end

class TrackSubclassesTest < Test::Unit::TestCase
  class A; end
  class B < A; end
  class C < B; end
  class D < A; end
  class E; end
  class F < E; end
  
  def test_subclasses
    assert_equal [F], E.subclasses
    assert_equal [C], B.subclasses
    assert_equal [B, D], A.subclasses(true).sort_by { |c| c.name }
    assert_equal [B, C, D], A.subclasses.sort_by { |c| c.name }
  end
end

