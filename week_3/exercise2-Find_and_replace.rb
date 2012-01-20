
def find_and_replace( filename, find, replace = '')
  if File.exists?( filename )
    File.open(filename, "r+") do |io|
      while line = io.gets
        if line.include? find
          #words = line.split(' ')
          puts line
        end
      end
    end
  end  
end

def init()
  filename = 'read_this_file.txt'
  find = 'word'
  replace = 'inserted word'
  num = 
  find_and_replace( filename, find, replace )
end

if __FILE__ == $0
  init
end