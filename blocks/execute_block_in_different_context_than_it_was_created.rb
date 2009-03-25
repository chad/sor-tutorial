local_variable_at_top_level = 'local variable from top level'

closure = lambda do
  p local_variable_at_top_level
  p method_define_in_context_of_object_where_closure_will_be_executed
end

class Person
  def method_define_in_context_of_object_where_closure_will_be_executed
    'method defined in context of Person object'
  end
  
  def proof_that_local_variable_at_top_level_is_not_available_within_objects_of_this_class
    p local_variable_at_top_level
  end
end

Person.new.instance_eval(&closure)

puts "\nAbout to change value of local_variable_at_top_level\n\n"
local_variable_at_top_level = 'changed'

Person.new.instance_eval(&closure)

# Person.new.proof_that_local_variable_at_top_level_is_not_available_within_objects_of_this_class
