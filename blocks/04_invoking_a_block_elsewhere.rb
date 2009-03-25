class Letter
  def letter
    self.class.name
  end
end

class A < Letter; end
class B < Letter; end
class C < Letter; end

class NotALetter
  attr_reader :captured_block, :other_objects
  def initialize
    @other_objects = [A.new, B.new, C.new]
  end
  
  def capture_block(&block)
    @captured_block = block
  end
  
  def invoke_in_other_objects
    other_objects.each do |other_object|
      other_object.instance_eval(&captured_block)
    end
  end
end

not_a_letter = NotALetter.new
not_a_letter.capture_block do
  puts letter
end

not_a_letter.invoke_in_other_objects
  
