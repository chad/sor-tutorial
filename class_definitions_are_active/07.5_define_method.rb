require 'time'
class Person
  [:name, :age, :dob].each do |method_name|
    define_method method_name do
      instance_variable_get("@#{method_name}")
    end
  end
  
  def initialize(name, age, dob)
    @name = name
    @age = age
    @dob = dob
  end
end

p Person.new("Marcel", 
               "ancient", 
                  Time.parse("marcel molina, jr.")).dob