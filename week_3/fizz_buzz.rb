=begin
 
 doctest: the first number printed by fizzbuzz is 1
 >> a = fizzbuzz
 >> a[0]
 => 1
 doctest: the third number printed by fizzbuzz is "Fizz"
 >> a[2]
 => "Fizz"
 doctest: the fifth number printed by fizzbuzz is "Buzz"
 >> a[4]
 => "Buzz"
 doctest: the 15th number printed by fizzbuzz is "FizzBuzz"
 >> a[14]
 => "FizzBuzz"
=end

def fizzbuzz
  out = Array.new
  (1..100).each do |n| 
    out.push((n % 3 == 0 && n % 5 == 0) && 'FizzBuzz' || (n % 3 == 0) && 'Fizz' || (n % 5 == 0) && 'Buzz' || n)
  end
  out
end

if __FILE__ == $0
  puts fizzbuzz.join(', ')
end