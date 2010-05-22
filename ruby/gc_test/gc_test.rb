class Foo
end

ObjectSpace.define_finalizer(Foo) do
  puts "gc'ing Foo"
end

ObjectSpace.define_finalizer(String) do
  puts "gc'ing String"
end

block = Proc.new do
  puts "gc'ing a String"
end

10_000.times do |n|
  string = "#{n}" # * 1000
  puts string
  ObjectSpace.define_finalizer(string, &block)
end

# GC.start

