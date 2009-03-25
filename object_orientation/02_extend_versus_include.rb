module Greetings
  def hello
    p 'Hi'
  end
end

class KmartWelcomer
  include Greetings
end

KmartWelcomer.new.hello

class WalMartWelcomer
  extend Greetings
end

WalMartWelcomer.hello

arbitrary_object = "This is a string"
arbitrary_object.extend(Greetings)
arbitrary_object.hello

arbitrary_object.include(Greetings)