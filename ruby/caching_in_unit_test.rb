# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'date'
require 'test/unit'

require 'rubygems'
require 'shoulda'

# class ClassVariableTest < Test::Unit::TestCase
#   # Cache the value of this as it takes a long time to compute
#   lvar = Time.now
#   VAR = Date::MONTHNAMES[lvar.month]
#   VAR.freeze
#   
#   should 'be able to use the value of the class variable' do
#     assert VAR
#   end
#   
#   should 'not be able to change the value of the class variable' do
#     assert VAR
#     
#     assert_raise(TypeError) do
#       VAR[0] = 'a'
#     end
#   end
#   
#   should 'not be able to replace the value of the class variable' do
#     assert VAR
#     VAR = 'some value'
#   end
# end

# # WORKS
# class ClassVariableTest < Test::Unit::TestCase
#   SOME_VALUE = 88
#   
#   context "" do
#     # Class variables aren't nil the first time they're accessed, like instance variables.  We need this for the conditional in the setup block
#     # We can't use instance variables because they get wiped out after each test automatically
#     @@var = nil
# 
#     setup do
#       puts "before"
#       if @@var.nil?
#         puts "inside"
#         @@var = SOME_VALUE
#         @@var.freeze
#       end
#       puts "after"
#     end
#   
#     should "be able to see a value in the cache" do
#       assert @@var
#       assert_equal(@@var, SOME_VALUE)
#       puts @@var
#     end
# 
#     should "be able to see a value in the cache without computing a second time" do
#       assert @@var
#       assert_equal(@@var, SOME_VALUE)
#       puts @@var
#     end
#   end
# end

class ConstantTest < Test::Unit::TestCase
  SOME_VALUE = 88
  
  context "" do
    setup do
      puts "before"

      begin
        assert VAR
      rescue NameError # Raised if we don't have a value cached yet  (We need to give it a value)
        # Why do we use constants for this?  Well, we can't use instance variables because they get wiped out after each test automatically.  Using a constant has the added benefit of giving us warnings if it is reassigned, unlike a frozen class variable.  (However, other than that, a frozen @@class_variable would work equally well, probably.)

        # We're caching because the following operation takes a while to compute.  Because the result often doesn't change between tests, caching the result helps the tests speed up a lot.  (There are lots of tests that would need this, so combining them all into one test is an unattractive option.)
        puts "inside"
        VAR = SOME_VALUE
        VAR.freeze
      end
      
      puts "after"
    end
  
    should "be able to see a value in the cache" do
      assert VAR
      assert_equal(VAR, SOME_VALUE)
      puts VAR
    end

    should "be able to see a value in the cache without computing a second time" do
      assert VAR
      assert_equal(VAR, SOME_VALUE)
      puts VAR
    end
  end
end

