class Module
  # Notice, this is an instance method
  def const_missing(name)
    puts "It's now always OK to refer to missing constants! (#{name})"
  end
end

O
THIS
IS
GREAT