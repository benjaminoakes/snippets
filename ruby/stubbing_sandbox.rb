# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'test/unit'

require 'rubygems'
require 'mocha'
require 'shoulda'

class Foo
end

class FooTest < Test::Unit::TestCase
  SOME_VALUE = 88

  context "Stubbing" do
    setup do
      Foo = stub(:stubbed_method => SOME_VALUE)
    end

    should "receive the correct value from the stub" do
      assert_equal(SOME_VALUE, Foo.stubbed_method)
    end
  end
end

