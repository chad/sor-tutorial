class NoCamelCase
  def self.method_added(method_name)
    if method_name.to_s =~ /[A-Z]/
      raise "You may not add #{method_name}! No caps in method names!"
    end
  end
end

class AClass < NoCamelCase
  def this_is_ok
  end
  
  def helloWorld
    puts "HI!"
  end
end