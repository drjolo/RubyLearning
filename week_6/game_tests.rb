require File.dirname(__FILE__) + '/game.rb'

=begin
 doctest: Game (save and load) test suite
 >> g = Game.new
 >> g.save_game('game.sav')
 >> sleep(1)
 >> g.load_game('game.sav')
 => "Your score is 1000."
 >> open("game.sav", "r+b") { |f| f.write("9") }
 >> g.load_game('game.sav')
 => 'RuntimeError: I suspect you of cheating.'
=end
