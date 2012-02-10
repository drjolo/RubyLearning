require File.dirname(__FILE__) + '/convert_shell.rb'

=begin
 doctest: Temperature Conversions in terminal are fun?
 >> true
 => true
 doctest: Decimal place temperatures are accepted
 >> convert_one( '2.35 cf' )
 => "= 36.23 F"
 doctest: Correct Standard to Metric Conversions
 >> convert_one( '100 cf' )
 => "= 212.0 F"
 doctest: Zero to zero works
 >> convert_one( '0 rk' )
 => "= 0.0 K"
 >> convert_one( '0 kr' )
 => "= 0.0 R"
 >> convert_one( '-273.15 cr' )
 => "= 0.0 R"
 >> convert_one( '-273.15 cf' )
 => "= -459.67 F"
 >> convert_one( '-459.67 fk' )
 => "= 0.0 K"
 >> convert_one( '-459.67 fc' )
 => "= -273.15 C"
 doctest: Negative Temperatures accepted
 >> convert_one( '-3 ck' )
 => "= 270.15 K"
 doctest: temperature below zero flagged
 >> convert_one( '-3 kc' )
 => "That temperature (-3 K) is below absolute zero!"
 doctest: Input is robust
 >> convert_one( '3kc' )
 => "= -270.15 C"
 >> convert_one( '100 Cc' )
 => "= 100.0 C"
 doctest: Example works!
 >> convert_one( '72 fc' )
 => '= 22.22 C'
 doctest: Incorrect Input is handled correctly
 This is for using incorrect units:
 >> convert_one( '72 gc' )
 => "Please select from the available temperatures to convert: degF (f), Rankine (r), degC (c), or Kelvin (k)"
 >> convert_one( '72' ).match(/^Incorrect Usage!\nTry \d{2} [c|f|k|r]{2}$/).nil?
 => false
=end
