binding # => #<Binding:0x030432a>

def gimme_a_binding!
  a_local_variable = 123
  binding
end

b = gimme_a_binding!

p eval("a_local_variable", b) # => 123