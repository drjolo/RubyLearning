def convert( temp, conversion )
  temp = temp.to_f
  conversion.downcase!
  temp = case conversion[0]
  when 'c'
    temp
  when 'f'
    (temp == -459.67) ? -273.15 : to_standard(temp)
  when 'k'
    temp - 273.15
  when 'r'
    (temp == 0) ? -273.15 : to_standard(temp, 'r')
  else
    raise(ArgumentError, "unit")
  end
  if (temp < -273.15)
    raise(ArgumentError, "below 0")
  end
  temp = case conversion[1]
  when 'c'
    temp
  when 'f'
    to_english(temp)
  when 'k'
    temp + 273.15
  when 'r'
    (temp == -273.15) ? 0 : to_english(temp, 'r')
  else
    puts ">" + conversion[1] + "<"
    raise(ArgumentError, "unit")
  end
end

def to_standard(temp, type = 'f')
  modifier = (type == 'r'? 491.67 : 32)
  (5.0/9)*(temp - modifier)
end

def to_english(temp, type = 'f')
  modifier = (type == 'r' ? 491.67 : 32)
  temp*9.0/5 + modifier
end
