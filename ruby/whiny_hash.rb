# WhinyHash whines when index with non-existent keys (instead of giving nil like Hash)
#
# Standalone:
#
#   h = Hash.new { |hash, key| raise ArgumentError, "Key not found: #{key.inspect}" }
class WhinyHash < Hash
  def initialize
    super { |h, k| raise ArgumentError, "Key not found: #{k.inspect}" }
  end
end

# # TODO maybe change over to minitest-spec
# describe WhinyHash do
#   before :each do
#     @h = WhinyHash.new
#     @h[:key] = 'value'
#   end
# 
#   it 'should whine about a non-existent key' do
#     lambda { @h[:non_existent] }.should raise_error(ArgumentError)
#   end
# 
#   it 'should still allow indexing' do
#     @h[:key].should == 'value'
#   end
# end
