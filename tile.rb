class Tile
  attr_accessor :status, :flagged

  def initialize(status = nil, flagged = false)
    @status = status
    @flagged = flagged
  end

  def reveal
    @status
  end

  def neighbors
  end

  def neighbor_bomb_count
  end

end
