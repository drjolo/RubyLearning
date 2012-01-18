=begin
 Suppose the ternary operator didn't exist.  How could you replicate the following bit of code using logic operators?
  
  >>puts 5 > 3 ? "yeah" : "boo" #=> nil
  yeah
  >>puts 5 < 3 ? "yeah" : "boo" #=> nil
  boo
   
=end

=begin
 TESTING:
 doctest: yeah_or_boo( 5,3 ) returns "yeah"
 >> yeah_or_boo( 5,3 )
 => "yeah"
 doctest: yeah_or_boo( 3,5 ) returns "boo"
 >> yeah_or_boo( 3,5 )
 => "boo"
=end

def yeah_or_boo( a,b )
  (a > b) && 'yeah' || 'boo'
end
