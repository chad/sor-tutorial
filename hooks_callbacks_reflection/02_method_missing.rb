class TellMeAnything
  def method_missing(method_name, *args, &block)
    p [method_name, args]
  end
end

TellMeAnything.new.whatever_you_like(1,2,3, "hello")