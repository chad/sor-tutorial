class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

class ExecutionContext
  attr_reader :context
  def initialize(context)
    @context = context
  end
  
  def execute(&block)
    context.instance_eval(&block)
  end
end

person = Person.new 'Chad'
execution_context = ExecutionContext.new(person)

execution_context.execute do
  p name
end

execution_context.name