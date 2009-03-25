class Banana
  puts "Hello"

  self.puts "Hello" rescue puts "puts is a private method"
  self.send(:puts, "Hello")
end