class DelayedBlockInvocation
  attr_reader :delayed_block
  
  def create(&block)
    puts "Defined block at #{Time.now.to_i}"
    @delayed_block = block
  end
  
  def invoke
    puts "Invoking block at #{Time.now.to_i}"
    puts "Time in block #{delayed_block.call}"
  end
end

delayed_block_invocation = DelayedBlockInvocation.new

delayed_block_invocation.create do
  Time.now.to_i
end

sleep 3

delayed_block_invocation.invoke