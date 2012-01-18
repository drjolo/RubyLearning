#This comes from rubyist.net

words = ['gogo', 'fun', 'Jabba the Hut']
secret = words[rand(3)]

puts rand(3)
print "guess? "
while guess = STDIN.gets
  guess.chop!
  if guess == secret
    puts "You win!"
    break
  else
    puts "Go Fish!"
  end
  print "guess? "
end
puts "The word was ", secret, "."


