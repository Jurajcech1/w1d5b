class Board

  def initialize(grid = Array.new(9) {Array.new(9)}) #populate board with tile instances
    @grid = grid
  end

  def populate_board(number_of_bombs)
    bombs = 0
    until bombs == 9
      x = rand(0..8)
      y = rand(0..8)
      if @grid[y][x].status.nil?
        @grid[y][x] = Tile.new(:b)
        bombs += 1
      end
    end
  end
end
