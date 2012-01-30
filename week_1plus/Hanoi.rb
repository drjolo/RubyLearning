#Ruby doesn't have a Stack object natively.  But now I can use stacks!
class Stack
  def initialize
    @stackArray = Array.new
  end
  def push(n)
    @stackArray.push(n)
  end
  def pop
    @stackArray.pop
  end
  def last
    @stackArray.last
  end
end

### METHODS ###
def Hanoi(n)
  #This error message doesn't work in Aptana.  The compiler catches the error first.
  raise "Error, Incorrect Input to Hanoi()! Expected usage: Hanoi(Fixnum)" if n.class != Fixnum
  
  #Initialize the Hanoi Board - Create Stacks:
  @p = Array.new(3, Stack.new)
  for i in (0..n-1); @p[0].push(n-i) end
  @steps = 0
  #Send the Hanoi Board to be solved. Move() is a recursive solver:
  move(n,0,2)
end

def move(num,start,finish)
  puts "move(#{[num, start+1, finish+1].join(", ")})"
  #IF only moving one disk, then move it ELSE recursively call move to figure out which disk should be moved where
  if num == 1 
    disk = @p[start].pop
    if disk < @p[finish].last
      @p[finish].push(disk)
      @steps += 1
      puts @steps
    else
      @p[start].push(disk)
      raise "Internal Error: Attempting to stack larger disk on smaller disk!"  #YAY, I never had to worry about seeing this error.
    end
  else
    #Determine the peg that isn't referenced in start or finish - This is required to get to the finish in the fewest steps
    ba = Array.new(3, false)
    ba[start] = true
    ba[finish] = true
    for i in (0..2); ba[i] = !ba[i] end
    other = ba.find_index(true)
    #Begin the recursive solution:
    move(num-1,start,other)
    move(1,start,finish)
    move(num-1,other,finish)
  end
end

### MAIN ####
puts "Welcome to the Tower of Hanoi Solver!\nHow many disks should I solve on the Tower of Hanoi?"
n = gets.chomp.to_i
while n.class != Fixnum || n <= 0
  puts "Please enter a number, not text, that is greater than 0!\nHow many disks should I solve on the Tower of Hanoi?"
  n = gets.chomp.to_i
end
Hanoi(n)
