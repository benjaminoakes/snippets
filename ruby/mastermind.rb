# Like the game of the same name.  I made this before I had an iPhone with a free version, as I recall.
# 
# I don't think the comparison stuff works quite right...  Example:
# 
#     ----------
#     Mastermind
#     ----------
#     
#     Guess the 4-number numeric sequence.  The numbers are between 1 and 7.  Separate with spaces.
#     
#     Guess #0: 1 2 3 4
#               Right place: 1, Correct value: 1
#     Guess #1: 1 2 5 6
#               Right place: 0, Correct value: 3
#     Guess #2: 2 5 6 4
#               Right place: 1, Correct value: 3
#     Guess #3: 5 6 2 4
#               Right place: 4, Correct value: 1
# 
# I should have won on the last play.  :(  Oh well...
# 
# Also, this doesn't make much sense:
# 
#     ----------
#     Mastermind
#     ----------
#     
#     Guess the 4-number numeric sequence.  The numbers are between 1 and 7.  Separate with spaces.
#     
#     Guess #0: 1 2 3 4
#               Right place: 0, Correct value: 2
#     Guess #1: 1 2 5 6
#               Right place: 0, Correct value: 2
#     Guess #2: 3 4 5 6
#               Right place: 2, Correct value: 1
#     Guess #3: 3 4 6 5
#               Congratulations!  You win!
# 
# (I was mucking around with the program when I did the 'you win' example above, though.  Might not be valid anymore.)
# 
# Feel free to fork and make it work, I guess.  :)
# 
# Author: Benjamin Oakes <hello@benjaminoakes.com>

# require 'test/unit'

class Range
  # Give a random number in this range (inclusive -- i.e. includes the endpoints of the range)
  def rand
    self.begin + Kernel.rand(self.end - (self.begin - 1))
  end
end

class Sequence
	class ComparisonException < Exception; end
	DEFAULT_SIZE = 4
	DEFAULT_RANGE = 1..7

  attr_reader :size, :range

  def initialize(size = DEFAULT_SIZE, range = DEFAULT_RANGE)
    @size = size
    @range = range

		loop do
			@secret = []
			
    	size.times do
				@secret << range.rand
			end

			break if @secret == @secret.uniq
		end

		@secret.freeze
  end

	def compare_with(guess)
		if guess.length != @secret.length
			raise ComparisonException.new('Wrong guess length')
		end

		copy = @secret.dup

		right_place_count = 0
		correct_value_count = 0

		copy.length.times do |index|
			if guess[index] == @secret[index] # Can't look at copy -- we're removing from it
				right_place_count += 1
				copy.delete_at(index)
			end
		end

		copy.length.times do |index|
			if copy.member?(guess[index])
				correct_value_count += 1
			end
		end
		
		return [right_place_count, correct_value_count]
	end

  def self.humanize_comparison(right_place_count, correct_value_count)
    return "Right place: #{right_place_count}, Correct value: #{correct_value_count}"
  end
end

# class RangeTest < Test::Unit::TestCase
#   # This depends on the size of the range.
#   # It should be large enough for the included numbers.
#   NumberOfTrials = 300
#   
#   def setup
#     @data = {}
#   end
#   
#   def observe(value)
#     if @data[value]
#       @data[value] += 1
#     else
#       @data[value] = 1
#     end
#   end
#   
#   def compile_histogram
#     output = ""
#     @data.to_a.sort.each do |value, occurrences|
#       output << "#{value}:\t#{'#' * occurrences}\n"
#     end
#     return output
#   end
#   
#   def assert_rand_only_gives_values_in_the_range
#     NumberOfTrials.times do
#       random_value = @range.rand
#       assert(random_value >= @start)
#       assert(random_value <= @stop)
#     end
#   end
#   
#   def assert_rand_gives_gives_at_least_one_occurrence_of_each_value
#     NumberOfTrials.times do
#       observe(@range.rand)
#     end
#     
#     if $DEBUG
#       puts(compile_histogram)
#     end
#     
#     @range.to_a.each do |value|
#       assert(@data[value] >= 1)
#     end
#   end
#   
#   def test_rand_with_positive_start
#     @start = 5
#     @stop = 20
#     @range = @start..@stop
#     
#     assert_rand_only_gives_values_in_the_range
#     assert_rand_gives_gives_at_least_one_occurrence_of_each_value
#   end
#   
#   def test_rand_with_negative_start
#     @start = -2
#     @stop = 5
#     @range = @start..@stop
#     
#     # # If there are occassional errors, this loop can be handy because of the randomness
#     # 1000.times do
#     #   @data = {}
#       assert_rand_only_gives_values_in_the_range
#       assert_rand_gives_gives_at_least_one_occurrence_of_each_value
#     # end
#   end
#   
#   def test_rand_with_negative_stop
#     @start = -20
#     @stop = -1
#     @range = @start..@stop
#     
#     # # If there are occassional errors, this loop can be handy because of the randomness
#     # 1000.times do
#     #   @data = {}
#       assert_rand_only_gives_values_in_the_range
#       assert_rand_gives_gives_at_least_one_occurrence_of_each_value
#     # end
#   end
#   
#   def test_rand_with_floating_point_range_with_positive_start
#     @start = 5.5
#     @stop = 20.5
#     @range = @start..@stop
#     
#     assert_rand_only_gives_values_in_the_range
#   end
#   
#   def test_rand_with_floating_point_range_with_negative_start
#     @start = -2.5
#     @stop = 5.5
#     @range = @start..@stop
#     
#     assert_rand_only_gives_values_in_the_range
#   end
#   
#   def test_rand_with_floating_point_range_with_negative_stop
#     @start = -20.5
#     @stop = -0.5
#     @range = @start..@stop
#     
#     assert_rand_only_gives_values_in_the_range
#   end
# end
# 
# class SequenceTest < Test::Unit::TestCase
# 	def setup
# 		@sequence = Sequence.new
# 		@secret = @sequence.instance_eval { @secret }
# 	end
# 
# 	def test_initialize_to_correct_size
# 		assert_equal(Sequence::DEFAULT_SIZE, @secret.length)
# 	end
# 
# 	def test_initialize_with_random_values
# 		assert @secret != Sequence.new.instance_eval { @secret }
# 	end
# 
# 	def test_initialize_gives_integer_values
# 		assert @secret.all? { |v| v == v.to_i }
# 	end
# 
# 	def test_compare_with_disjoint
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([0, 0], @sequence.compare_with([5, 6, 7, 8]))
# 	end
# 
# 	def test_compare_with_same
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([4, 0], @sequence.compare_with([1, 2, 3, 4]))
# 	end
# 
# 	def test_compare_with_first_half_right
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([2, 0], @sequence.compare_with([1, 2, 5, 6]))
# 	end
# 
# 	def test_compare_with_second_half_right
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([2, 0], @sequence.compare_with([5, 6, 3, 4]))
# 	end
# 
# 	def test_compare_with_all_right_values_but_in_wrong_place
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([0, 4], @sequence.compare_with([2, 3, 4, 1]))
# 	end
# 
# 	def test_compare_with_all_right_values_with_first_two_reversed
# 		@sequence.instance_eval { @secret = [1, 2, 3, 4] }
# 		assert_equal([2, 2], @sequence.compare_with([2, 1, 3, 4]))
# 	end
# 
# 	# Regression test
# 	def test_compare_with_mutiple_duplicates_inputs
# 		@sequence.instance_eval { @secret = [3, 7, 4, 5] }
# 		assert_equal([1, 0], @sequence.compare_with([3, 3, 3, 3]))
# 	end
# end

def parse(guess_string)
	return guess_string.split(/\s+/).map { |s| s.to_i }
end

sequence = Sequence.new

puts "----------"
puts "Mastermind"
puts "----------"
puts
puts "Guess the #{sequence.size}-number numeric sequence.  The numbers are between #{sequence.range.begin} and #{sequence.range.end}.  Separate with spaces."
puts

MARGIN = ' ' * 10

10.times do |guess_number|
	begin
		print "Guess ##{guess_number}: "
		guess = gets

		if guess.nil?
			puts
			puts 'Exiting...'
			exit
		end

		comparison = sequence.compare_with(parse(guess))
	rescue Sequence::ComparisonException => e
		puts "#{MARGIN}Comparison failed: #{e.message}"
		retry
	end

	if [4, 0] == comparison[0]
		puts "#{MARGIN}Congratulations!  You win!"
		exit
  else
	  puts MARGIN + Sequence.humanize_comparison(*comparison)
	end
end

puts "#{MARGIN}You lose.  :("
puts sequence.instance_eval { @secret.inspect }

