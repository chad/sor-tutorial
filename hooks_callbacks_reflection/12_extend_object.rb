module NotHangingAround
  def self.extend_object(o)
    puts "Not really extending #{o}."
    puts "But we could if we called super here."
  end
  
  def a_method_from_NotHangingAround
    puts "You called a_method_from_NotHangingAround"
  end
end

module X
  def a_method_from_X
    puts "You called a_method_from_X"
  end 
end

a = ['an', 'object', 'to', 'extend']
a.extend NotHangingAround
a.extend X

a.a_method_from_X
a.a_method_from_NotHangingAround