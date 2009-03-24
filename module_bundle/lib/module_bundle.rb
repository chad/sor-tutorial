module ModuleBundle
  class << self
    def new(&block)
      module_bundle = Module.new(&block)
      class << module_bundle
        def included(klass)
          included_modules.each do |included_module|
            klass.send(:include, included_module)
          end
        end
      end
      module_bundle
    end
    
  end
end