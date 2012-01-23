=begin
 doctest: When given an array, sum_array(arr) returns the sum of its elements
 >> arr = Array.new
 >> total = 0
 >> 5.times do |i|
     num = rand(5)
     arr[i] = num
     total += num
     end
 >> sum_array(arr)
 => total
=end

def sum_array(arr)
  arr.inject(:+)
end
