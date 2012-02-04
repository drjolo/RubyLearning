require File.dirname(__FILE__) + '/text_analyzer.rb'

=begin
 Your text analyzer will provide the following basic statistics:

Character count
Character count (excluding spaces)
Line count
Word count
Sentence count
Paragraph count
Average number of words per sentence
Average number of sentences per paragraph 
=end

=begin
 doctest: TextAnalyzer test suite
 >> ta = TextAnalyzer.new()
 >> ta.analyze( 'text.txt' )
 => {:chars=>6044, :chars_no_spaces=>5055, :lines=>121, :words=>1114, :sentences=>44, :paragraphs=>18, :wps=>25.318181818181817, :spp=>2.4444444444444446}
=end