module ActsAsCargoCult
  def self.included(klass)
    klass.extend ClassLevelMethods
  end
  
  def cult_member?
    ClassLevelMethods.cult_members.include?(self.class)
  end
  
  module ClassLevelMethods
    def self.cult_members
      @@cult_members
    end
    def acts_as_cargo_cult
      (@@cult_members ||= []) << self
    end
  end
end

Object.send(:include, ActsAsCargoCult)

class A
  acts_as_cargo_cult
end

class B
  acts_as_cargo_cult
end

p ActsAsCargoCult::ClassLevelMethods.cult_members

p A.new.cult_member?

p "not a cult member".cult_member?