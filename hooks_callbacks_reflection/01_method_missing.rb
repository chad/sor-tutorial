class WillNotWork
end

WillNotWork.new.this_method_does_not_exist!

# What happens when I call it?

Object.new.send(:method_missing, :foo)
