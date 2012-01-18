=begin
 doctest: prompt method should work the same here as it does elsewhere
 >> prompt("type 'y':")
 => "y"
=end

require "~/Aptana Studio 3 Workspace/Learning_Ruby/week_2/prompt.rb"


if __FILE__ == $0
  input = prompt("name?")
  puts "Hello #{input}"
end

def try 
  if block_given? 
    yield 
  else 
    puts "no block" 
  end 
end 
try do puts "hello" end