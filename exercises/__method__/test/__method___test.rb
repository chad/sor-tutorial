require File.dirname(__FILE__) + '/../lib/__method__'
require 'test/unit'

class Method__Test < Test::Unit::TestCase
  class Foo
    def foo
      __method__
    end

    def bar
      foo
    end

    def baz
      bar
    end
  end
    
  def test___method___works_regardless_of_nesting
    f = Foo.new
    [:foo, :bar, :baz].each do |method|
      assert_equal 'foo', f.send(method), "Expected method '#{method}' to return 'foo' but it returned '#{f.send(method)}'"
    end
  end
end