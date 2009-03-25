def yield_way
  p yield
end

def block_call_way(&block)
  p block.call
end

yield_way { 'this is the yield way' }

block_call_way { 'this is the block.call way' }