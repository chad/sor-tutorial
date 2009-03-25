puts "About to define a block of code"

block = lambda do
  puts 'Invoked'
end

puts "About to invoke a block of code"

block.call