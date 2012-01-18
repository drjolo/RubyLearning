=begin
 doctest: prompt method should return a user's input
 >> prompt("type 'a':")
 => "a"
=end

def prompt( prompt_text )
  puts prompt_text
  STDOUT.flush
  gets.chomp
end

