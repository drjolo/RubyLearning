require File.dirname(__FILE__) + '/mp3_analyzer'

=begin
 doctest: Mp3_analyzer class test suite
 >> ma = Mp3_analyzer.new('song.mp3')
 >> ma.analyze
 => {:song=>"Dancing Shoes", :artist=>"Cliff Richard and The Shadows", :album=>"(SUMMER HOLIDAY  1963)", :year=>"2000", :comment=>"#100%-Free-MP3s(Dalnet) Anni"}
 >> ma.has_tag?
 => true

This song doesn't exist ( analyze should print a warning and quit )
 >> ma.analyze( 'new_song.mp3' )
 => false
 >> ma.has_tag?
 => false

This next file exist but isn't an mp3 file and is shorter than 128 bytes
 >> ma.analyze( 'test.rb' )
 => false
 >> ma.has_tag?
 => false

This file isn't an mp3 and is bigger than 128 bytes
 >> ma.analyze( 'image.png' )
 => false
 >> ma.has_tag?
 => false
=end
