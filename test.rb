deck = %w(a, b, c, x, y, z, 6)
hand = deck[0..5]
hand.delete_at(0)
puts hand

for i in (0..5)
  # puts i
  puts i % 3
end