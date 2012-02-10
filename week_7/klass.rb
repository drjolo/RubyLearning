=begin
doctest: Klass test suite
>> obj = Klass.new
>> obj.say_hello
=> "hello"
>> obj = Klass.new('goodbye')
>> obj.say_hello
=> "goodbye"
=end


class Klass
  def initialize( message = 'hello' )
    @message = message
  end
  def say_hello
    @message
  end
  def to_s
    @message
  end
end
