require File.dirname(__FILE__) + '/../lib/in_memory_associations'
require 'test/unit'

class InMemoryAssociationsTest < Test::Unit::TestCase
  def setup
    @person = Class.new
    @membership = Class.new
    @group = Class.new
    [@person, @membership, @group].each do |klass|
      class << klass
        include InMemoryAssociations
      end
    end
    assert_nothing_raised do
      @person.has_many :memberships
      @person.belongs_to :pond
      @person.has_many :groups, :through => :memberships
      @membership.belongs_to :person
      @membership.belongs_to :group
    end    
  end

  def test_has_many_generates_an_instance_method_of_the_provided_name
    assert_respond_to @person.new, :memberships
  end

  def test_has_many_methods_default_to_empty_array
    assert_equal [], @person.new.memberships
  end
  
  def test_belongs_to_generates_an_instance_method_of_the_provided_name
    assert_respond_to @person.new, :pond
    assert_respond_to @person.new, :pond=
    howard = @person.new
    howard.pond = "Walden"
    assert_equal "Walden", howard.pond
  end
  
  def test_has_many_through_generates_an_instance_method_of_the_provided_name
    assert_respond_to @person.new, :groups
  end

  def test_has_many_through_methods_default_to_empty_array
    assert_equal [], @person.new.groups
    howard = @person.new
    membership = @membership.new
    membership.group = g = @group.new
    howard.memberships << membership
    assert_equal [g], howard.groups #FIXME not done yet
  end
end