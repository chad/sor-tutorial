class Data
  class Base
    def self.inherited(new_subclass)
      puts "#{new_subclass} inherited from me"
      create_db_file_for(new_subclass)
    end
    
    def self.db_file_path
      "/tmp/#{self.name}.db"
    end
    
    def self.create_db_file_for(klass)
      # ... File.open(db_file_path, "wb"), etc.
    end
  end
end

class Person < Data::Base
end

class Group < Data::Base
end

p Person.db_file_path
p Group.db_file_path