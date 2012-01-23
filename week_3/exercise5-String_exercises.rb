=begin
 doctest: hash_string_to_pairs(string) separates a string with a key/value pair into separate strings
 >> key = ':id'
 >> value = rand(10).to_i.to_s
 >> test_string = "#{key}=#{value}"
 >> arr = hash_string_to_pairs( test_string )
 >> arr == [key, value]
 => true
=end

def hash_string_to_pairs( hash_string )
  key, value = hash_string.split( '=' )
  if key && value then return key, value end
  raise "invalid input (hash_string = '#{hash_string}') should follow key=value format"
end
