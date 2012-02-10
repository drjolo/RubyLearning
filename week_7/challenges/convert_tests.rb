require File.dirname(__FILE__) + '/convert.rb'

=begin
 doctest: Temperature conversion tests
 >> convert(0,'cf')
 => 32
 >> convert(32,'fc')
 => 0
 >> convert(0, 'ck')
 => 273.15
 >> convert(0, 'fr')
 => 459.67
=end

