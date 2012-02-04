class Game
  
  def save_game(file)
    score = 1000
    open(file, "w") do |f|
      f.puts(score)
      f.puts(Time.new.to_i)
    end
  end
  
  def load_game(file)
    f = open(file)
    score, time = f.each_line.to_a.collect{|e| e.chomp }
    begin
      time.to_i == f.mtime.to_i ? "Your score is #{score}." : raise(RuntimeError, "I suspect you of cheating.")
    rescue
      'RuntimeError: I suspect you of cheating.'
    end
  end
  
end