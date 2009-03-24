require File.dirname(__FILE__) + '/../lib/module_bundle'
require 'test/unit'

class ModuleBundleTest < Test::Unit::TestCase
  module Inner
    def self.included(klass)
      klass.extend(ClassMethods)
    end
    
    module ClassMethods
      def local?
        true
      end
    end
  end
  
  def test_wrapping_the_inner_module_in_a_regular_module_does_not_call_inner_modules_included_method_when_included
    regular_module = Module.new do
      include Inner
    end
    
    dummy_class = Class.new do
      include regular_module
    end
    
    assert_raises(NoMethodError) do
      dummy_class.local?
    end
  end
  
  def test_creating_a_module_bundle_does_not_raise
    assert_nothing_raised do
      ModuleBundle.new
    end
  end
  
  def test_creating_a_module_bundle_returns_a_module
    assert_kind_of Module, ModuleBundle.new
  end
  
  def test_creating_a_module_bundle_that_is_passed_a_block_behaves_like_regular_module
    module_bundle = nil
    assert_nothing_raised do
      module_bundle = ModuleBundle.new do
        def foo
          :foo
        end
      end
    end
    
    dummy_class = Class.new do
      include module_bundle
    end
    
    assert_nothing_raised do
      dummy_class.new.foo
    end
    
    assert_equal :foo, dummy_class.new.foo
  end
  
  def test_module_bundle_can_have_a_module_included_into_it
    module_bundle = ModuleBundle.new
    inner_module_was_mixed_in = lambda { module_bundle.public_methods.include?('local?') }
    assert !inner_module_was_mixed_in.call
    assert_nothing_raised do
      module_bundle.send(:include, Inner)
    end
    assert inner_module_was_mixed_in.call
  end
  
  def test_including_a_module_in_a_module_bundle_and_then_including_the_bundle_in_a_class_calls_the_inner_modules_included_method
    module_bundle = ModuleBundle.new
    assert_nothing_raised do
      module_bundle.send(:include, Inner)
    end
    
    dummy_container_class = Class.new
    assert_nothing_raised do
      dummy_container_class.send(:include, module_bundle)
    end
    
    assert_nothing_raised do
      dummy_container_class.local?
    end
    
    assert dummy_container_class.local?
  end
end