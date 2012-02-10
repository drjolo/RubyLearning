require File.dirname(__FILE__) + '/klass.rb'

save = Klass.new
File.open('save_file', 'w') do |io|
  Marshal.dump(save, io)
end

new_save = Object.new
File.open('save_file', 'r') do |io|
  new_save = Marshal.load(io)
end

puts new_save.to_s
puts save.to_s
