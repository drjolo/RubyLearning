############################################
# Go Fish Game, by Nathan Feaver
# 
# Just like the classic, collect pairs to win
# Version 0.1
# Hooray!
#
# inspired by the guess.rb program from Ruby User's guide @ rubyist.net\
############################################

#Require and Includes:
#require "backports"

#GoFish cards are generated with pairs:
cards = (1...11).to_a #generates cards 1-10
cards *= 4 #Each card is repeated 4 times

#Some Global Variables (Are they 'Global' variables in Ruby?)
@@hand_size = 5

#### METHODS ####
def game(deck, np = 2)
  #shuffle the deck:
  @deck = deck.sort_by{rand}
  @ds = @deck.size
  p = [0..np-1] # player class array
  puts "How many human players? (input 0-#{np}, the rest will be computer controlled)"
  humans = gets.chomp.to_i
  #Deal out the cards and initialize each player class in the array: p
  for i in (0..np-1)
    if i <= humans-1
      puts "Please enter the names of player \##{i+1}:"
      name = gets.chomp
      h = deal(@deck, @@hand_size)
      p[i] = Player.new(0,h,name)
    else
      h = deal(@deck, @@hand_size)
      p[i] = Player.new(1,h)
    end
  end
  #Start Playing
  p_turn = rand(np-1)
  puts "np:"+np.to_s
  puts "p_turn+1:"+(p_turn+1).to_s
  play = true
  while play==true
    puts "The player to go first is: Player \#"+(p_turn+1).to_s+": "+p[p_turn].name.to_s
    puts "Here are your cards:\n"
    p[p_turn].show()
    while p[p_turn].match()
      puts "You've got a match!"
      puts "Here are your cards:\n"
      p[p_turn].show()
    end
    puts "What card do you want to ask for a match? (input the card \#, ie 1-#{@@hand_size})"
    requestc = gets.chomp
    requestc = p[p_turn].hand[requestc]
    puts "Who do you want to ask for that card? (input the number of the player)\n"
    for i in (0..np-1)
      if i==p_turn
        next
      end
      puts "#{i}: "+p[i].name
    end
    requestp = gets.chomp
    puts "#{p[requestp].name}, Do you have a #{requestc} card?"
    if p[requestp].hand.include?(requestc)
      p[requestp].give(requestc)
    end
  end
end

#Deal from 'deck', 'n' cards
def deal(deck, n)
  if @ds >= n
    dealt = deck[0..n-1]
    @deck = deck[n..@ds]
    @ds -= n
  else
    return
  end
  return dealt
end

#### CLASSES ####
class Player
  attr_accessor :name, :hand
  def initialize(type, hand, name = %w[joe hannah steve mary gordon nikki ryan amy ben kristen].choice)
    name = name.capitalize
  end
  def show()
    puts "#{hand}"
    #for i in (0..@@hand_size-1)
    #  puts "#{i+1}: #{hand[i]}"
    #end
  end
  def match()
    m = false
    c = 0
    while !m
      for i in (c+1..@@hand_size-1)
        if hand[c]==hand[i]
          m = true
          hand.delete_at(c)
          hand.delete_at(i)
        end
      end
      if c == @@hand_size-2 then break end
      c += 1
    end
    return m
  end
  def draw(n)
    for i in (0..n-1)
      hand = hand.insert(deck[i])
    end
  end
end

#### MAIN ####
cont = true
while cont == true
  puts "Would you like to play a new game? (y/n)"
  query = gets.chomp
  case query
  when "y", "Y", "yes", "Yes"
    cont = true
    puts "Here we go!"
    while cont == true
      puts "How many players? (humans and computers, 2-5)"
      np = gets.chomp().to_i
      if np >= 1 && np <= 5
        puts "Let's play!"
        game(cards, np)
        break
      else
        puts "You cannot play with that number of players, please input a number between 2 and 5"
      end
    end
  when "n", "N", "no", "No", "exit", "quit"
    cont = false
    puts "Come back soon!"
    break
  else
    puts "That input is incorrect! Please use \'y\' or \'n\'"
  end
end

