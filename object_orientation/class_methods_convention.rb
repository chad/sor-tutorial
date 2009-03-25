module ModuleThatProvidesInstanceMethodsAndClassMethods
  def this_will_be_added_as_an_instance_method
    p 'i am an instance method'
  end
  
  module ClassMethods
    def this_will_be_added_as_a_class_method
      p 'i am a class method'
    end
  end
  
  def self.included(class_included_into)
    puts "\nAbout to include #{self} into #{class_included_into}"
    puts
    class_included_into.extend(ClassMethods)
  end
end

class ClassTheModuleWillBeIncludedInto
end

p ClassTheModuleWillBeIncludedInto.included_modules
p ClassTheModuleWillBeIncludedInto.public_methods.grep(/this_will/)
p ClassTheModuleWillBeIncludedInto.public_instance_methods.grep(/this_will/)

class ClassTheModuleWillBeIncludedInto
  include ModuleThatProvidesInstanceMethodsAndClassMethods
end

p ClassTheModuleWillBeIncludedInto.included_modules
p ClassTheModuleWillBeIncludedInto.public_methods.grep(/this_will/)
p ClassTheModuleWillBeIncludedInto.public_instance_methods.grep(/this_will/)

