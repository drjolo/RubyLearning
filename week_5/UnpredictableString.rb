class UnpredictableString < String
  def scramble!
    self.replace(self.chars.to_a.shuffle.join)
  end
end

if __FILE__ == $0
  str = UnpredictableString.new('hello world')
  str.scramble!
  puts str
end