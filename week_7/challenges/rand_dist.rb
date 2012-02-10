def rand_dist( iterations = 100000, buckets = 20 )
  a = Array.new(buckets, 0)
  iterations.times do
    n = rand - rand
    i = ((n + 1)/2 * buckets).to_i
    a[i] += 1
  end
  delta = 20/buckets
  bucket = -1
  next_bucket = bucket + delta.to_f/10.round(3)
  buckets.times do |i|
    puts "(#{bucket}..#{next_bucket}) => #{'*' * (a[i]/100)}"
    bucket = (bucket*10 + delta).to_f/10.round(3)
    next_bucket = (bucket + delta.to_f/10).round(3)
  end
end

rand_dist