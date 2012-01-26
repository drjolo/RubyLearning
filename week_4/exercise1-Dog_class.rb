

class Dog
  attr_reader :name
  def initialize( name = 'Lassie' )
    @name = name
  end
  def bark
    
  end
  def eat
    
  end
  def chase_cat
    
  end
  
  def teach_to( trick_name )
    return nil if self.respond_to?( trick_name )
    define_singleton_method( trick_name ) do
      if block_given?
        yield
      else
        "#{@name} is doing the #{trick_name} trick!"
      end
    end
  end
  
  def method_missing( method_name, *args, &block )
    "#{@name.capitalize} is confused because he/she hasn't been taught how to #{method_name} yet"
  end
end




