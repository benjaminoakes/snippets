# I'm often annoyed that I have to do things like:
# 
#     if foo == 'needle' || bar == 'needle' || baz == 'needle' || ...
#       # ...
#     end
# 
# I thought it'd be fun to see if I could overload the == method somehow... but I *DON'T* recommend that approach!  (I wrote this a *long* time ago.)
# 
# I do some variation on this now:
#
#     if [foo, bar, baz].any? { |v| 'needle' == v }
#       # ...
#     end
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# Original idea:
# def check(var, *values)
#   output = true
#   values.each do |value|
#     output &= (value == var)
#   end
#   return output
# end
# 
# check(some_var, "a", "b", "c")
# 
# # Or do :<< on the booleans

module TestMultipleValues
  def ==(value)
    if value.respond_to?(:each)
      # TODO
    end
  end
end

class TrueClass
  include TestMultipleValues
end

class FalseClass
  include TestMultipleValues
end

