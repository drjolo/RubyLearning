#encoding: utf-8
=begin
def test_yield
  puts 'inside'
  a = 2
  puts a
  yield
  puts 'end of method'
end

test_yield {
  unless a == 2
    a = 5
  end
  b = 6
  puts a+b
}
=end

def mtdarry
 10.times do |num|
 puts num
 end
end
puts mtdarry