class Rectangle  
  def initialize(*args)  
    puts args.class
    if args.size < 2  || args.size > 3  
      # modify this to raise exception, later  
      puts 'This method takes either 2 or 3 arguments'  
    else  
      if args.size == 2  
        puts 'Two arguments'  
      else  
        puts 'Three arguments'  
      end  
    end  
  end  
end  
Rectangle.new([10, 23], 4, 10)  
Rectangle.new([10, 23], [14, 13]) 