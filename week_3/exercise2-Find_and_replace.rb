
def find_and_replace( filename, find, replace = '')
  if File.exists?( filename )
    offset = 0
    File.open(filename, "r+") do |io|
      while line = io.gets
        offset += line.length
        if line.include? find
          offset += line.index(find)
          break
          
          #words = line.split(' ')
          #line.gsub(/#{find}/, replace)
        end
      end
    end
    IO.write(filename, replace, offset)
  end  
end

def init()
  filename = 'read_this_file.txt'
  find = 'word'
  replace = 'inserted word'
  find_and_replace( filename, find, replace )
end

if __FILE__ == $0
  init
end