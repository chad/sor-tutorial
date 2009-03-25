module BeforeFilter
  def self.extended(klass)
    klass.instance_variable_set(:@__before_filters, {})
    attr_reader :__before_filters
  end
  
  def before(method_name, &block)
    (__before_filters[method_name] ||= []) << block
    method_with_before_filters    = "#{method_name}_with_filters"
    method_without_before_filters = "#{method_name}_without_filters"
    
    unless public_instance_methods.include?(method_with_before_filters)
      class_eval(<<-EVAL, __FILE__, __LINE__)
        def #{method_with_before_filters}(*args, &block)
          self.class.__before_filters[:#{method_name}].each do |block|
            instance_eval(&block)
          end
          #{method_without_before_filters}(*args, &block)
        end
      EVAL
      alias_method method_without_before_filters, method_name
      alias_method method_name, method_with_before_filters
    end
  end
end

class MorningRoutine
  def work;                    p 'Working...'                  end
  def drive_to_work;           p 'Driving to work'             end
  def get_in_car;              p 'Getting in car'              end
  def lock_house;              p 'Locking house'               end
  def put_on_work_clothes;     p 'Putting on work clothes'     end
  def get_briefcase;           p 'Get briefcase'               end
  def take_shower;             p 'Taking shower'               end
  def brush_teeth;             p 'Brushing teeth'              end
  def undress;                 p 'Undressing'                  end
  def uncap_toothpaste;        p 'Uncapping toothpaste'        end
  def put_toothpaste_on_brush; p 'Putting toothpaste on brush' end
  def get_out_of_bed;          p 'Getting out of bed'          end
  def go_to_bathroom;          p 'Go to bathroom'              end
end

class MorningRoutine
  extend BeforeFilter
  
  before :work do
    take_shower
    brush_teeth
    drive_to_work
  end
  
  before :drive_to_work do
    lock_house
    get_in_car
  end
  
  before :take_shower do
    undress
  end
  
  before :brush_teeth do
    uncap_toothpaste
    put_toothpaste_on_brush
  end
  
  before :undress do
    get_out_of_bed
    go_to_bathroom
  end
  
  before :lock_house do
    put_on_work_clothes
    get_briefcase
  end
end

# MorningRoutine.new.work