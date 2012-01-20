=begin
 doctest: test multiline blocks
 >> a = [1, 2]
 >> a.each_index do |n|
     a[n] = 5; end 
 >> a
 => [5, 5] 
=end

def returns_multiple_strings
  return "string1", "string2"
end

a = returns_multiple_strings
puts a
puts a.class
