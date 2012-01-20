=begin
 doctest: create_and_go(directory) creates a new directory (unless it exists) and goes there
 >> dir = Dir.getwd
 >> create_and_go('temp')
 >> Dir.getwd == dir + '/temp'
 => true
 doctest: back_up_and_rmdir() goes back one directory and deletes the current directory
 >> Dir.getwd == dir + '/temp'
 => true
 >> if Dir.getwd == dir + '/temp' then back_up_and_rmdir end
 >> Dir.getwd == dir
 => true
 >> Dir.exists?( 'temp' )
 => false
=end

def create_and_go( directory )
  current = Dir.getwd
  if directory.class == String
    Dir.mkdir( directory ) unless Dir.exists?( directory )
    Dir.chdir( current + '/' + directory )
  else
    exit
  end
end

def back_up_and_rmdir
  current_dir = Dir.getwd
  dir_to_rm = current_dir.match(/\w+$/)[0]
  Dir.chdir('../')
  Dir.delete( dir_to_rm )
end
