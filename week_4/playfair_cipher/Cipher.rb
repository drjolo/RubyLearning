# The program enciphers and deciphers messages composed of letters only.
# The rules of the cipher follow the playfair cipher where a unique cipher
# square is generated base on a cipher key phrase. 
# 
# Author:: Nathan Feaver
# Copyright:: Copyright (c) 2012 Nathan Feaver
# License:: Distributes under the same terms as Ruby
# 
# [encipher( key, message )] returns an encoded message
# [decipher( key, message )] returns a decoded message
# [square] returns the playfair cipher square: 5x5 array of letters
# 


class Cipher
  attr_accessor :square
  def initialize
    @message = String.new
    @digraphs = Array.new
    @square = Array.new
    @offset = 1
  end
  
  def initialize
    if DEBUG do
      key = 'miscellaneous pirates'
      self.generate_square( key )
    end
  end
  
  # This method takes a string and returns an array of 2 letter digraphs corresponding to the playfair rules
  # The append functionality should be used to add strings to the end of an existing message
  
  def digraph( message, append = false )
    new_digraphs = []
    messagef = message.upcase
    messagef.delete!(' ')
    messagef['J'] = 'I' while messagef['J']
    write = true
    x_alternate = true
    messagef.length.times do |i|
      if write
        write = false
        if messagef[i] == messagef[i+1]
          new_digraphs << messagef[i] + (x_alternate ? 'X' : 'Z')
          x_alternate = !x_alternate
          write = true
        elsif i+1 == messagef.length
          new_digraphs << messagef[i] + 'X'
        else
          new_digraphs << messagef[i,2]
        end
      else
        write = true
      end
    end
    if append
      @digraphs << new_digraphs
      @message += message
    else
      @digraphs = new_digraphs
      @message = message
    end
    @digraphs
  end
  
  # this generates the cipher square from a supplied key
  
  def generate_square( key = '' )
    begin
      puts "Please enter the cipher key:"
      key = gets.chomp
    end if key == ''
    key.upcase!
    key.delete!(' ', 'J')
    key.strip!
    alphabet = ('A'..'Z').to_a
    alphabet.delete( 'J' )
    row = []
    square = []
    key.each_char do |c|
      if alphabet.index( c )
        row << c
        alphabet.delete( c )
      end
      if row.length == 5
        square << row.values_at(0..4)
        row.clear
      end
    end
    alphabet.each do |c|
      row << c
      if row.length == 5
        square << row.values_at(0..4)
        row.clear
      end
    end
    @square = square
  end
  
  # This method enciphers an array of digraphs using a cipher square that has already been generated
  
  def enc!( digraphs = @digraphs, offset = 1 )
    @offset = offset
    digraphs.each do |digraph|
      a,b = get_coordinates( digraph[0] )
      x,y =  get_coordinates( digraph[1] )
      new_digraph = case
      when a == x then @square[a][rotate(b)] + @square[x][rotate(y)]
      when b == y then @square[rotate(a)][b] + @square[rotate(x)][y]
      else
        @square[a][y] + @square[x][b]
      end
      digraph.replace( new_digraph )
    end
  end
  
  # This method returns the coordinates of a rotated row or column element, wrapping if necessary
  def rotate( coord )
    (coord + @offset) % @square.length
  end
  
  # This method finds where a particular letter is in the cipher square
  def get_coordinates( letter )
    i, j = 0,0
    @square.each_index { |index| i,j = index, @square[index].index( letter ) if @square[index].index( letter ) }
    return i, j
  end
  
  # This method takes an enciphered array of digra
  def dec!( digraphs = @digraphs )
    enc!( digraphs, -1 )
  end
  
  def encipher( key, message )
    self.digraph( message )
    self.generate_square( key )
    self.enc!.join
  end
  
  def decipher( key, message )
    self.digraph( message )
    self.generate_square( key )
    self.dec!.join
  end
  
end

if __FILE__ == $0
  DEBUG = false
  pf = Cipher.new
  puts "Type 'exit' to quit"
  puts 'The Playfair Cipher, Written by Nathan Feaver, Uses Ruby 1.9+'
  puts 'Please enter your cipher key:'
  key = gets.chomp
  exit 0 if key == 'exit'
  puts "Type '1-message' to encipher and '2-encoded message' to decipher"
  begin
    "Please type your message now:"
    message = gets.chomp
    puts pf.encipher( key, message[2,message.length-2] ) if message[0].to_i == 1
    puts pf.decipher( key, message[2,message.length-2] ) if message[0].to_i == 2
  end until message == 'exit'
end