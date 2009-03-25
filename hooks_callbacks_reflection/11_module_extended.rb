module OnYourEigenClass
  def self.extended(klass_i_extended)
    puts "Hey, #{klass_i_extended}, I'm on your eigenclass!"
  end
  
  def here_is_a_new_method
    puts "You called the new method"
  end
end

class Bud
  extend OnYourEigenClass
end
Bud.here_is_a_new_method

"dude".extend OnYourEigenClass

