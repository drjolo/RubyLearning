
def encode( mstr )
  mstr.replace 'BA'
end

str = 'AB'

puts "Before: #{str}"
encode( str )
puts "After: #{str}"