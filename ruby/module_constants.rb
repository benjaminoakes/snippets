# Author: Benjamin Oakes <hello@benjaminoakes.com>

# module MyModule
#   MODULE_CONSTANT = 'foo'
# 
#   def foo
#     puts self::CLASS_CONSTANT
#     puts MODULE_CONSTANT
#   end
# end
# 
# class MyClass1
#   CLASS_CONSTANT = 'bar'
# 
#   include MyModule
# 
#   def bar
#     foo
#   end
# end
# 
# class MyClass2
#   CLASS_CONSTANT = 'quux'
# 
#   include MyModule
# 
#   def quux
#     foo
#   end
# end
# 
# puts MyClass1.new.bar
# puts MyClass2.new.quux

module CommonMethods
  BAR = 'foo'
  
  def shout_my_constant
    puts BAR
    puts self::Const.upcase
  end
end

class NonInstantiableClass
  extend CommonMethods
  
  Const = "hello, world!"
end

NonInstantiableClass.shout_my_constant

