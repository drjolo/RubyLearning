
def find_changes( path1, path2 )
  file1 = File.open( path1 )
  file2 = File.open( path2 )
  changes = []
  newline = true
  while line2 = file2.gets
    if newline
      line1 = file1.gets
      newline = false
    end
    if line1 != line2
      changes << line2
    else
      newline = true
    end
  end
  file1.close
  file2.close
  changes
end

if __FILE__ == $0 then puts find_changes( 'old-inventory.txt', 'new-inventory.txt' ) end