class A 
  def self.const_missing(name)
    puts "You tried to refer to the missing constant #{name}. That's OK, though."    
  end
  
  def an_instance_method
    ThisIsAlsoOK
  end
end


A.new.an_instance_method