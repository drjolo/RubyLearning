
require File.dirname(__FILE__) + '/dtrconvertor.rb'
require File.dirname(__FILE__) + '/fix_bug.rb'

=begin
 doctest: tests after fix_bug
 >> c = DTRConvertor.new
 >> c.convert(1)
 => 38
=end
