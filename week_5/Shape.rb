class Shape
  attr_accessor :type, :heading, :sound_effect_path
  def initialize( type, sound_effect_path )
    @type = type
    @heading = rand(360)
    @sound_effect_path = sound_effect_path
  end
  
  def rotate
    36.times do
      @heading = (@heading + 10) % 360
      sleep 0.05
    end
  end
  
  def play_sound_effect
    #...
  end
  
  def on_click
    rotate
    play_sound_effect
  end
end

class Square < Shape
  def initialize
    super( 'Square', 'Square_sound_effect' )
  end
end

class Circle < Shape
  def initialize
    super( 'Circle', 'Circle_sound_effect' )
  end
end

class Triangle < Shape
  def initialize
    super( 'Triangle', 'Triangle_sound_effect' )
  end
end

class Amoeba < Shape
  def initialize( center_point )
    super( 'Amoeba', 'Amoeba_sound_effect' )
    @center = center_point
  end
  
  def rotate( rotate_around )
    radius = Math.sqrt( (center_point[0] - rotate_around[0]) ** 2 + (center_point[1] + rotate_around[1]) ** 2 )
    theta = 0
    36.times do
      #code to display shape
      sleep 0.05
      theta += Math::PI / 18
      @center = [rotate_around[0] + radius * Math.cos(theta), rotate_around[1] + radius * Math.sin(theta)]
    end
  end
  
  def on_click( click_point )
    play_sound_effect
    rotate( click_point )
  end
end