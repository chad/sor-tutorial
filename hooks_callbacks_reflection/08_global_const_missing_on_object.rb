class Object
  def self.const_missing(name)
    puts "Sometimes you'll see it done like this (#{name})"
  end
end

STILL 
WORKS