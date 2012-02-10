=begin
 usage:
 interval_repeat( seconds_for_interval, minutes_for_total_time, proc_to_be_repeated )
 
 returns:
 runs the block at specified interval for the total time specified
=end

def interval_repeat( interval, length )
  finish = Time.now + (length * 60)
  begin
    yield
    sleep interval
  end while Time.now < finish
end

class Counter
  attr_reader :count
  
  def initialize
    @count = 0
  end
  
  def increment
    @count += 1
  end
  
  def decrement
    @count -= 1
  end
  
  def to_s
    @count
  end
  
end

c = Counter.new
code = lambda do
  puts "start"
  c.increment
  puts "finish - Result: #{c.to_s}"
end

interval_repeat(3, 0.5) { code.call }
