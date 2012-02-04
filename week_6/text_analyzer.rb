require 'logger'

class TextAnalyzer
  
  def initialize
    @info = { chars: 0, chars_no_spaces: 0, lines: 0, words: 0, sentences: 0, paragraphs: 0, wps: 0, spp: 0 }
    @log = Logger.new('text_analyzer.log', 'monthly')
    @log.level = Logger::DEBUG
  end
  
  def analyze( filename )
    count_first_paragraph = true
    new_paragraph = false
    begin
      File.open(filename, 'r') do |io|
        while line = io.gets
          @info[:chars] += line.strip.size
          @info[:chars_no_spaces] += line.strip.delete(' ').size
          @info[:lines] += 1
          @info[:sentences] += line.count('.!?')# + line.count('!') + line.count('?')
          @info[:words] += line.scan(/\w+/).length
          if new_paragraph || count_first_paragraph
            if line != "\r\n"
              @info[:paragraphs] += 1
              new_paragraph = false
              count_first_paragraph = false
            end
          end
          #this makes sure you aren't counting paragraphs for additional returns or returns at the end of a document
          if line == "\r\n" then new_paragraph = true end
          @log.debug("@info: #{@info}#{', start of new paragraph' if new_paragraph}")
        end
      end
    rescue
      @log.error("Couldn't open supplied file")
    end
    
    begin
      raise('There is a divide by 0 error because there are no sentences') if @info[:sentences] == 0
      @info[:wps] = @info[:words].to_f / @info[:sentences]
    rescue
      @log.error('divide by 0 error - @info[:sentences] = 0')
      @info[:wps] = NaN
    end
    begin
      raise('There is a divide by 0 error because there are no paragraphs') if @info[:paragraphs] == 0
      @info[:spp] = @info[:sentences].to_f / @info[:paragraphs]
    rescue
      @log.error('divide by 0 error - @info[:paragraphs] = 0')
      @info[:spp] = NaN
    end
    
    @log.debug('END OF ANALYSIS')
    @info
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