require './prompt'
begin
  read = gets.chomp
  puts eval( read )
end while( read != 'exit' )
