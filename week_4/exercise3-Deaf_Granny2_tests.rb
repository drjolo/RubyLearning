require File.dirname(__FILE__) + '/exercise3-Deaf_Granny2.rb'

=begin
 doctest: Grandma can remember how many times you've said 'BYE' in a row
 >> bettie = Grandma.new
 >> bettie.exit_count
 => 0
 >> bettie.inquire( 'BYE' )
 >> bettie.exit_count
 => 1
 >> bettie.inquire( 'BYE' )
 >> bettie.exit_count
 => 2
 >> bettie.inquire( 'BYE' )
 >> bettie.exit_count
 => 3
 >> 2.times do bettie.inquire( 'BYE' ) end
 >> bettie.exit_count
 => 5
 >> bettie.inquire( 'HELLO' )
 >> bettie.exit_count
 => 0
 doctest: inquire( str_query ) returns "HUH?! SPEAK UP, SONNY!" if you don't inquire with caps
 >> sue = Grandma.new
 >> str_query = 'hello'
 >> sue.inquire( str_query )
 => "HUH?! SPEAK UP, SONNY!"
 doctest: inquire( str_query ) returns "NO, NOT SINCE #{year}!" with a random year between 1930 and 1950 if you query with all caps
 >> claudia = Grandma.new
 >> str_query = 'HELLO'
 >> claudia.inquire( str_query ).match(/^NO, NOT SINCE \d{4}!$/).nil?
 => false
 >> (1930..1950).include? claudia.inquire( str_query ).split(' ')[3].to_i
 => true
 doctest: inquire( SENTINAL ) returns "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!"
 >> marilyn = Grandma.new
 >> responses = []
 >> 3.times do |i| responses[i] = marilyn.inquire( 'BYE' ) end
 >> responses[2]
 => "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!"
=end