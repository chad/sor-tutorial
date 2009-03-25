class Person
  local_variable = 'Alan'
  
  define_method :name_with_define_method do
    p local_variable
  end
  
  def name_with_def
    p local_variable
  end
end

person = Person.new

person.name_with_define_method
person.name_with_def