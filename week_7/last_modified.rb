=begin
 doctest: last_modified
 >> f = File.open('test_mod', 'w')
 >> f.close
 >> tm = File.mtime('test_mod')
 >> last_modified('test_mod', 2)
 => 'file was last modified 0.0 days ago'
 >> puts last_modified('../test.rb')
=end

def last_modified( file, digits = 15 )
  days = ( Time.now - File.mtime(file) ) / ( 60*60*24 )
  "file was last modified #{days.round(digits)} days ago"
end