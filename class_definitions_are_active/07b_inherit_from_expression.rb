local = 'var'
class MyArray < Class.new(Array) { define_method(:foo) do p local end}
end

MyArray.new.foo