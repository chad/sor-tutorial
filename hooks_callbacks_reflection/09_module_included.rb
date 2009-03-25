module SeeksApproval
  def self.included(klass_i_was_included_into)
    puts "I'd like to thank #{klass_i_was_included_into} for including me!" 
  end
end

class CoolKids
  include SeeksApproval
end
