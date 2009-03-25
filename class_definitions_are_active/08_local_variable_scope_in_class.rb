class Foo
  variable = 'bar'

  define_method :bar do
    variable
  end
end


p Foo.new.bar

# Make Foo.new.bar return 'baz' without reopening the class






























ObjectSpace.each_object(Proc){|o| 
  if eval("local_variables", o.binding).include?("variable")
    eval("variable = 'baz'", o.binding)
    break
  end
}

p Foo.new.bar