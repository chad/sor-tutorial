module InMemoryAssociations
  def has_many(things, options = {})
    if through = options[:through]
      define_method(through, &association_reader(through, [])) unless instance_methods.include?(through)
      define_method(things) do
        send(through).map do |through_thing|
          # Yes, naive singularization.
          through_thing.send(things.to_s.chomp("s"))
        end
      end
    else
      define_method(things, &association_reader(things, []))
    end
  end
  
  def belongs_to(thing)
    define_method(thing, &association_reader(thing))
    define_method("#{thing}=") do |value|
      instance_variable_set("@#{thing}", value)
    end
  end
  
  private
    def association_reader(name, default_value = nil)
      lambda do
        ivar_name = "@#{name}"
        instance_variable_set(ivar_name, 
                              instance_variable_get(ivar_name) || default_value)
      end
    end
end