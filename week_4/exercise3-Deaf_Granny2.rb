class Grandma
  attr_reader :exit_count
  
  def initialize( exit_keyword = 'BYE' )
    @exit_count = 0
    @sentinal = exit_keyword
  end
  
  def inquire( query )
    if query == @sentinal
      @exit_count += 1
      return @exit_count > 2 ? "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!" : self.response
    end
    @exit_count = 0
    query == query.upcase ? self.response : "HUH?! SPEAK UP, SONNY!"
  end
  
  def response
    "NO, NOT SINCE #{1930 + rand(20)}!"
  end
  
  def exit?
    @exit_count > 2
  end
end

def speak_with_granny
  puts "What would you like to say when you want to stop talking with Grandma? (remember that sometimes she has a hard time hearing it though)"
  exit_keyword = gets.chomp
  granny = Grandma.new( exit_keyword )
  puts "You're now speaking with Grandma:"
  begin
    greeting = gets.chomp
    puts granny.inquire( greeting )   
  end until( granny.exit? )
end

speak_with_granny if __FILE__ == $0