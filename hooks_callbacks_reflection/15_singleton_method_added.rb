# From Ruby RDoc
 module Chatty
   def Chatty.singleton_method_added(id)
     puts "Adding #{id.id2name}"
   end
   def self.one()     end
   def two()          end
   def Chatty.three() end
 end
 
