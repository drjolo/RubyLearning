#encoding: utf-8

def handle_string_output ( str )
  str.each_line.with_index {|line, i| puts "Line #{i+1}: #{line}"; i+=1}
  exit 0
end

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"
handle_string_output(s)
