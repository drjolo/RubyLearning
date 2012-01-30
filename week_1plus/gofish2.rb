
#### INCLUDE/REQUIRE ####


#### METHODS ####
def game(pnum)
  #Get Deck of cards, shuffle, and deal to players:
  deck = Deck.new()
  deck.shuffle()
  nCards = 5
  if pnum == 2 {nCards += 2}
  for i in (0..pnum-1)
    p[i].hand = deck.getCard(nCards)
  end
  #Fill a turn Queue:
  playerTurn = Queue.new
  start = rand(pnum-1)
  pnum.times do |i|
    playerTurn << (start + i) % pnum
  end
  
  while (cont)
    atBat = playerTurn.pop
    playerTurn << atBat
    p[atBat].checkMatches()
    
  end
end

def turn(player)
  
end

#### CLASSES ####
class Deck
  attr_reader :stack, :cards
  
  def initialize
    # Standard 52 card deck: 13 cards per suit, 4 suits
    @cards = (1...14).to_a #generates cards 1-13
    @cards *= 4 #Each card is repeated 4 times
    @stack = @cards.length
    return nil
  end
  def shuffle
    @cards = @cards.shuffle
  end
  def getCard(n)
    if n <= @stack
      inhand = Array.new(n)
      for i in (0..n-1)
        j = -(i+1)
        inhand[i] = @cards[j]
        @cards.delete_at(j)
      end
      @stack -= n
    else
      return nil
    end
    return inhand
  end
end

class Player
  attr_accessor :name, :hand
  def checkMatches
    
  end
end

#### MAIN ####
tdeck = Deck.new()
hand = tdeck.get_card(5)
names = %w(Henry Jackie Steven Mary Joe Beth Ben Kristen Tim Amy Dave Kara Ryan Rachel Paul Angeline)

#puts "#{hand}"
cont = true
while cont == true
  puts "Would you like to play a new game? (y/n)"
  query = gets.chomp
  case query
  when "y", "Y", "yes", "Yes"
    puts "Here we go!"
    check = false
    puts "How many players? (humans and computers, 2-5)"
    while check == false
      np = gets.chomp().to_i
      if np >= 1 && np <= 5 then check = true; break end
      puts "You cannot play with that number of players, please input a number between 2 and 5:"
    end
    check = false
    puts "How many are human?"
    while check == false
      nh = gets.comp.to_i
      if nh <= np  && nh >= 1 then check = true; break end
      puts "That doesn't work.  Please input a number between 1 and #{np}:"
    end
    p=Array.new(np)
    p.each {|i| p[i] = Player.new}
    for i in (0..np-1)
      if i <= np
        puts "Please enter the names of player \##{i+1}:"
        newname = gets.chomp
        p[i].name = newname
      else
        p[i].name = names.sample
      end
    end
    
    puts "Let's play!"
    game(np)
  when "n", "N", "no", "No", "exit", "quit"
    cont = false
    puts "Come back soon!"
    break
  else
    puts "That input is incorrect! Please use \'y\' or \'n\'"
  end
end
