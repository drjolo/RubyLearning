class Grandma
  attr_reader :exit_count
  
  def initialize
    @exit_count = 0
    @exit_flag = false
    @SENTINAL = 'BYE'
  end
  
  def inquire( query )
    if query == @SENTINAL
      @exit_count += 1
      @exit_flag = true if @exit_count > 2
      return "OKAY DEARIE, DON'T FORGET TO WASH BEHIND THE EARS!!!" if @exit_flag
      return self.response
    end
    @exit_count = 0
    query == query.upcase ? self.response : "HUH?! SPEAK UP, SONNY!"
  end
  
  def response
    year = 1930 + rand(20)
    "NO, NOT SINCE #{year}!"
  end
  
  def exit?
    @exit_flag
  end
end

def speak_with_granny
  granny = Grandma.new
  puts "You're now speaking with Grandma:"
  begin
    greeting = gets.chomp
    puts granny.inquire( greeting )   
  end until( granny.exit? )
end

if __FILE__ == $0 then speak_with_granny end