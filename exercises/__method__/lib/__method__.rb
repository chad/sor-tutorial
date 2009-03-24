module Kernel
  def __method__
    caller[0][/`([^']+)'/, 1]
  end
end