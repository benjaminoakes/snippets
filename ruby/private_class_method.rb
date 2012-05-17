class Foo
  def self.my_public_method
    "I'm public!"
  end

  def self.my_private_method
    "I'm private!"
  end

  private_class_method :my_private_method
end

class Bar
  class << self
    def my_public_method
      "I'm public!"
    end

    private

    def my_private_method
      "I'm private!"
    end
  end
end

puts "Foo.my_public_method: #{(Foo.my_public_method).inspect}"

begin
  puts "Foo.my_private_method: #{(Foo.my_private_method).inspect}"
rescue NoMethodError
  puts 'Foo.my_private_method unavailable'
end

puts "Bar.my_public_method: #{(Bar.my_public_method).inspect}"

begin
  puts "Bar.my_private_method: #{(Bar.my_private_method).inspect}"
rescue NoMethodError
  puts 'Bar.my_private_method unavailable'
end

# Output:
#
#     Foo.my_public_method: "I'm public!"
#     Foo.my_private_method unavailable
#     Bar.my_public_method: "I'm public!"
#     Bar.my_private_method unavailable
