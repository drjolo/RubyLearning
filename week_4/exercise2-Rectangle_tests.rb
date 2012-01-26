require File.dirname(__FILE__) + '/exercise2-Rectangle.rb'

=begin
 doctest: a Rectangle can be implemented by two length arguments and area and perimeter will be available
 >> l1, l2 = 23.45, 34.67
 >> box = Rectangle.new( l1, l2 )
 >> box.area
 => 813.01
 >> box.perimeter
 => 116.24
 doctest: a Rectangle can be implemented by two coordinates of opposite corners
 >> c1, c2 = [-2,-1], [2,1]
 >> box = Rectangle.new( c1, c2 )
 >> box.area
 => 8
 >> box.perimeter
 => 12
 doctest: a Rectangle will give a warning if given wrong input data
 >> arr1, arr2 = [1], [1,2]
 >> boxz = Rectangle.new( arr1, arr2 )
 >> puts 'PASS IF: warning printed above'
 >> boxz.area
 => 0
=end