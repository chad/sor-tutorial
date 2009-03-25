module ActiveSomething
  def self.included(klass)
    extend ClassMethods
    include InstanceMethods
  end
  
  module InstanceMethods
    def save
      # save it
    end
  end
  module ClassMethods
    def find(*args)
      # find stuff
    end
  end
end

# How do you feel about this organizational strategy?