def stored_context
  name = "default"
  {
    :name= => lambda{|n| name = n },
    :name => lambda{ name }
  }
end


context = stored_context
p context[:name][]
context[:name=]["Jorge"]
p context[:name][]#!/usr/bin/ruby

