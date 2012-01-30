class TrulyRandom
  def self
    self.replace( 'Nathan!'.chars.to_a.shuffle.join )
  end
end

new_str = TrulyRandom.new
puts new_str.self



