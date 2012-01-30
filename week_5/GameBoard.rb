class GameBoard
  def initialize
    @board = Array.new
  end
  def set_locations_cells( locations )
    @board = locations
  end
  def check_yourself( loc )
    match = @board.include?( loc )
    @board.delete( loc ) if match
    @board.empty? ? 'kill' : match
  end
end