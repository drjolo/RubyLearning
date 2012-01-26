def file_swap( pathA, pathB )
  pathC = File.dirname(pathA) + '/.temp'
  move( pathA, pathC )
  move( pathB, pathA )
  move( pathC, pathB )
end

def move( old_path, new_path )
  File.link( old_path, new_path )
  File.delete( old_path )
end

if __FILE__ == $0
  pathA, pathB = 'docs/first.txt', 'docs/second.txt'
  file_swap( pathA, pathB )
end