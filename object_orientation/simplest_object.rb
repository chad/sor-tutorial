object = Object.new
p object
object.public_methods.sort.each do |method_name|
  next if method(method_name).arity != 0 || method_name == 'freeze'
  puts "#{method_name.rjust(20)}: #{object.send(method_name)}"
end