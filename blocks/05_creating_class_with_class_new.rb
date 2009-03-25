local_variable = 'Alan'

DynamicClass = Class.new do
  p local_variable
end

class StaticClass
  p local_variable
end