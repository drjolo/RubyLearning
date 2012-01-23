=begin
 doctest: when I say 'good bye' to grandma, I exit the method
 &gt;&gt; speak_with_granny
    'good bye'
    0
 doctest: when I speak to grandma, she replies HUH?! SPEAK UP SONNY!
 &gt;&gt; speak_with_granny
 &gt;&gt; hi grandma
    HUH?! SPEAK UP SONNY!
=end

def speak_with_granny
  puts "You're now speaking with Grandma:"
  begin
    greeting = gets.chomp
    if greeting == greeting.upcase
      puts "NO, NOT SINCE 1938!"
    else
      puts "HUH?! SPEAK UP, SONNY!"
    end    
  end while( greeting != "good bye")
end

speak_with_granny