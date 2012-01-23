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
 doctest: Text Analyzer works!
 >> ta = TextAnalyzer.new()
 >> ta.analyze( 'text.txt' )
 >> ta.chars
 => 6044
 >> ta.chars_no_spaces
 => 5055
 >> ta.lines
 => 121
 >> ta.words
 => 1114
 >> ta.sentences
 => 44
 >> ta.paragraphs
 => 18
=end

class TextAnalyzer
  attr_reader :chars, :chars_no_spaces, :lines, :words, :sentences, :paragraphs, :words_per_sentence, :sentences_per_paragraph
  def initialize
    @chars = 0
    @chars_no_spaces = 0
    @lines = 0
    @words = 0
    @sentences = 0
    @paragraphs = 0
    @words_per_sentence = 0
    @sentences_per_paragraph = 0
    @count_first_paragraph = true
  end
  def analyze( filename )
    new_paragraph = false
    File.open(filename, 'r') do |io|
      while line = io.gets
        @chars += line.strip.size
        @chars_no_spaces += line.strip.delete(' ').size
        @lines += 1
        @sentences += line.count('.') + line.count('!') + line.count('?')
        @words += line.scan(/\w+/).length
        if new_paragraph || @count_first_paragraph
          if line != "\r\n"
            @paragraphs += 1
            new_paragraph = false
            @count_first_paragraph = false
          end
        end
        #this makes sure you aren't counting paragraphs for additional returns or returns at the end of a document
        if line == "\r\n" then new_paragraph = true end
      end
    end
    @words_per_sentence = @words.to_f / @sentences
    @sentences_per_paragraph = @sentences.to_f / @paragraphs
  end
  def report
    "Characters: #{@chars}\nCharacters with no spaces: #{@chars_no_spaces}\nLines: #{@lines}\nWords: #{@words}\nSentences: #{@sentences}\nParagraphs: #{@paragraphs}\nWords per sentence: #{@words_per_sentence}\nSentences per paragraph: #{@sentences_per_paragraph}\n"               
  end
end

if __FILE__ == $0
  puts "What text(file) would you like to analyze?"
  STDOUT.flush
  file = gets.chomp
  puts "\nAlrighty, here it is:"
  ta = TextAnalyzer.new()
  ta.analyze(file)
  puts ta.report
end