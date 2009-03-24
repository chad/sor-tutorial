module OpenConst
  module OpenStructable
    def method_missing(name, *args, &block)
      name = name.to_s
      @attributes ||= {}
      if name.to_s =~ /=$/
        @attributes[name.sub(/=$/, '')] = args.first
      else
        @attributes[name]
      end
    end
  end

  def self.make_class
    k = Class.new
    k.send(:include, OpenStructable)
    k
  end

  def self.const_missing(name)
    const_set(name, make_class)
  end
  
  c = Animal.new
  c.name = "Bonobo"
  puts c.name
end

