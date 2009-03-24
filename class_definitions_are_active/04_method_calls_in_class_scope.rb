class Banana
  puts "Hello"
  p method(:puts)
  self.puts "Hello" rescue puts "puts is a private method"
  self.send(:puts, "Hello")
end