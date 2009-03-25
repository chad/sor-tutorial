number = 0
grow_by_two = lambda do
 number += 2
end

p grow_by_two.call
p grow_by_two.call

class AnotherScopeEntirely
  attr_reader :closure
  def initialize(closure)
    @closure = closure
  end
  
  def call_closure
    p closure.call
    
    p number
  end
end

puts "\nCalling closure in another scope entirely"
another_scope = AnotherScopeEntirely.new(grow_by_two)
another_scope.call_closure