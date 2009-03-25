class Person
  @name = ""
  @age = 0
  
  def self.name
    @name
  end
  
  def self.name=(name)
    @name = name
  end
end
p Person.name
Person.name = "Marcel"
p Person.name