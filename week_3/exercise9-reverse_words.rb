=begin
 doctest: reverse_words(str) will return str with the word order reversed
 >> str = 'hello world'
 >> reverse_words(str)
 => 'world hello'
=end

def reverse_words(str)
  str.split.reverse!.join(' ')
end
