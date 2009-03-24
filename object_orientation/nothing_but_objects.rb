animal = Object.new

def animal.to_s
  "animal"
end

def animal.say(something)
  puts "#{self} says #{something}"
end

def animal.speak
  say "I am speaking"
end

def animal.eat(food)
  say "Thanks for the #{food}"
end


dog = animal.clone

def dog.to_s
  "Dog"
end

def dog.speak
  say "Woof"
end
  
  
animal.eat("pear")
animal.speak
  
dog.speak