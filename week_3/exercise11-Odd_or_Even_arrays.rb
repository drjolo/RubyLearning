=begin
 doctest: parity(ary), prints each element of a collection and tells you if it is odd or even
 >> ary = [12, 23, 456, 123, 4579]
 >> parity(ary)
 => "12: even\n23: odd\n456: even\n123: odd\n4579: odd"
 doctest: odd_or_even(Integer), returns the string 'odd' for odd numbers and 'even' for even ones
 >> odd_or_even(1)
 => 'odd'
 >> odd_or_even(2)
 => 'even'
=end

def parity( ary )
  report = ''
  ary.each do |i|
    report << "#{i}: #{odd_or_even(i)}\n"
  end
  report.chomp
end

def odd_or_even( n )
  n.even? ? 'even' : 'odd'
end
