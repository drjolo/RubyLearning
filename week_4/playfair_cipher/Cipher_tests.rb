require File.dirname( __FILE__ ) + '/Cipher.rb'
DEBUG = true

=begin
 doctest: Cipher.digraph( str ) generates digraph pairs that are correctly formatted
 >> pf = Cipher.new
 >> str = [ 'hello', 'world', 'congress shall', 'john' ]
 >> digraphs = []
 >> str.each_index { |i| digraphs[i] = pf.digraph( str[i] ) }
 >> digraphs
 => [['HE', 'LX', 'LO'], ['WO', 'RL', 'DX'], ['CO', 'NG', 'RE', 'SX', 'SZ', 'SH', 'AL', 'LX'], ['IO', 'HN'] ]
 doctest: Cipher.generate_square( key ) creates the correct cipher square for key
 >> pf = Cipher.new #see Cipher.test_setup for method call
 >> pf.square
 => [["M", "I", "S", "C", "E"], ["L", "A", "N", "O", "U"], ["P", "R", "T", "B", "D"], ["F", "G", "H", "K", "Q"], ["V", "W", "X", "Y", "Z"]]
 doctest: Cipher.enc!( digraphs ) uses the generated square to encode digraphs
 >> pf = Cipher.new
 >> digraph_set = [['HE', 'LX', 'LO'], ['IO', 'HN'], ['AW', 'ES', 'OM', 'EX']]
 >> digraph_set.each { |digraphs| pf.enc!( digraphs ) }
 => [['QS', 'NV', 'AU'], ['CA', 'XT'], ['RI', 'MC', 'LC', 'SZ']]
 doctest: Cipher.get_coordinates( char ) returns the coordinates of any letter in the cipher square
 >> pf = Cipher.new
 >> letters = %w{ M A Q R }
 >> coordinates = []
 >> letters.each { |letter| coordinates << pf.get_coordinates( letter ) }
 >> coordinates
 => [[0, 0], [1,1], [3,4], [2,1]]
 doctest: Calling Cipher.dec!( digraphs ) decodes the string
 >> pf = Cipher.new
 >> digraph_set = [['HE', 'LX', 'LO'], ['IO', 'HN'], ['AW', 'ES', 'OM', 'EX']]
 >> digraph_set.each { |digraphs| pf.dec!( pf.enc!( digraphs ) ) }
 => [['HE', 'LX', 'LO'], ['IO', 'HN'], ['AW', 'ES', 'OM', 'EX']]
 doctest: Cipher.encipher( cipher_key, message ) returns an encoded message
 >> pf = Cipher.new
 >> pf.encipher( 'playfair example', 'Hide the gold in the tree stump')
 => "BMODZBXDNABEKUDMUIXMMOUVIF"
 doctest: Cipher.decipher( cipher_key, message ) returns a decoded message
 >> pf = Cipher.new
 >> pf.decipher( 'playfair example', 'BMODZBXDNABEKUDMUIXMMOUVIF' )
 => "HIDETHEGOLDINTHETREXESTUMP"
=end