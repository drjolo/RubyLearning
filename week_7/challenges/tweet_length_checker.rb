
File.open('ruby_shell_tweets.txt') do |io|
  count = 0
  while line = io.gets
    count += 1
    puts "Line \##{count}: #{line.length}"
    puts "Tweet on line #{count} is too long: #{line}" if line.length > 140
  end 
end