load 'tile.rb'

class Board
  TRANSFORMATIONS = [[-1, -1], [-1, 0], [-1, 1], [0, 1], [1, 1,], [1, 0], [1, -1], [0, -1]]

  attr_reader :grid

  def initialize(grid = Array.new(9) {Array.new(9) { Tile.new }}) #populate board with tile instances
    @grid = grid
    populate_board(9)
  end

  def populate_board(number_of_bombs)
    bombs = 0
    until bombs == number_of_bombs
      x = rand(0..8)
      y = rand(0..8)
      if @grid[y][x].status.nil?
        @grid[y][x].status = :b
        bombs += 1
      end
    end
  end

  def on_board?(pos)
    pos[0].between?(0,8) && pos[1].between?(0,8)
  end

  def neighbors(pos)
    neighbors_arr = []
    TRANSFORMATIONS.each do |transformation|
      neighbor = []
      neighbor << transformation[0] + pos[0]
      neighbor << transformation[1] + pos[1]
      state = @board[neighbor[0]][neighbor[1]].status
      neighbors_arr << neighbor if on_board?(neighbor) && state != :r && state.class != Fixnum
    end
    neighbors_arr
  end

  def surrounding_bombs(pos)
    neighbors = neighbors(pos)
    count = 0
    neighbors.each do |neighbor|
      count += 1 if @board[neighbor[0]][neighbor[1]].status == :b
    end
    count
  end

  def reveal_neighbors(pos)
    queue = [pos]

    until queue.empty?
      current_pos = queue.shift
      num_bombs = surrounding_bombs(current_pos)
      if num_bombs > 0
        @board[current_pos[0]][current_pos[1]].status = num_bombs
      else
        queue += neighbors(pos)
        @board[current_pos[0]][current_pos[1]].status = :r
      end
    end
  end


end





# test_board = Board.new
# test_board.grid.each do |line|
#   line.each {|tile| p tile.status}
# end
