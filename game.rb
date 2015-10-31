load 'board.rb'
load 'tile.rb'

class Minesweeper

  def initialize(board=Board.new)
    @board = board
  end

  def play_turn
  end

  def get_guess
    puts "Enter 'f(a,b)' to flag at position a, b"
    puts "Or enter 'r(a,b)' to reveal at position a, b"

    input = gets.chomp
    output = [[]]
    output.unshift(input[0])
    output[1] << input[2].to_i
    output[1] << input[4].to_i
    output
  end



end
