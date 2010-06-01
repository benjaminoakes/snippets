# Ruby class/test demonstration code.
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

require 'test/unit'

class Animal
  def speak
    fail
  end
end

class Cat < Animal
  def speak
    return 'Meow!'
  end
end

class Dog < Animal
  def speak
    return 'Woof!'
  end
end

class AnimalTest < Test::Unit::TestCase
  def setup
    @animal = Animal.new
  end

  def test_speak_fails
    assert_raise(RuntimeError) do
      @animal.speak
    end
  end
end

class CatTest < Test::Unit::TestCase
  def setup
    @garfield = Cat.new
  end

  def test_speak
    assert_equal('Meow!', @garfield.speak)
  end
end

class DogTest < Test::Unit::TestCase
  def setup
    @fido = Dog.new
  end

  def test_speak
    assert_equal('Woof!', @fido.speak)
  end
end

