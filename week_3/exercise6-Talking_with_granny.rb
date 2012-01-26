=begin
 doctest: inquire( str_query ) returns "HUH?! SPEAK UP, SONNY!" if you don't inquire with caps
 >> str_query = 'hello'
 >> inquire( str_query )
 => "HUH?! SPEAK UP, SONNY!"
 doctest: inquire( str_query ) returns "NO, NOT SINCE #{year}!" with a random year between 1930 and 1950 if you query with all caps
 >> str_query = 'HELLO'
 >> inquire( str_query ).match(/^NO, NOT SINCE \d{4}!$/).nil?
 => false
 >> (1930..1950).include? inquire( str_query ).split(' ')[3].to_i
 => true
 doctest: inquire( SENTINAL ) returns "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!"
 >> inquire( 'BYE' )
 => "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!"
=end

SENTINAL = 'BYE'

def speak_with_granny
  puts "You're now speaking with Grandma:"
  begin
    greeting = gets.chomp
    puts inquire( greeting )   
  end until( greeting == SENTINAL )
end

def inquire( query )
  if query == SENTINAL
    return "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!"
  end
  if query == query.upcase
    year = 1930 + rand(20)
    "NO, NOT SINCE #{year}!"
  else
    "HUH?! SPEAK UP, SONNY!"
  end
end

if __FILE__ == $0 then speak_with_granny end