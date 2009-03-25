class Person
  attr_accessor :name
end

person = Person.new
person.name = 'Marcel'

print 'person.instance_eval("name") -> '
p person.instance_eval("name")
puts

print 'person.instance_eval { name } -> '
p person.instance_eval { name }
puts

description = lambda do
  name
end

print 'person.instance_eval(&description) -> '
p person.instance_eval(&description)
puts 

class Description
  def to_str
    'name'
  end
  
  def to_proc
    description_method = to_str
    p "Outside lambda in to_proc self == #{inspect}"
    lambda do
      p "Inside lambda in to_proc self == #{inspect}"
      send description_method
    end
  end
end

# Object coerced to string which is invoked in context of person
p person.instance_eval(Description.new)
# Object coerced to proc which is invoked in context of person
p person.instance_eval(&Description.new)

p person.instance_eval(description)

