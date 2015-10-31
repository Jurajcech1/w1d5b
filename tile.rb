class Tile
  attr_accessor :status, :flagged

  def initialize(status = nil, flagged = false)
    @status = status
    @flagged = flagged
  end

  def reveal
    @status
  end

  def flagged?
    @flagged
  end

  

end
