class Game
  
  attr_accessor :board, :player_1, :player_2
  
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]
  
  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end
  
  def current_player
    if @board.turn_count % 2 == 0
      @player_1
    else
      @player_2
    end
  end
  
  def won?
    WIN_COMBINATIONS.find { |combo| combo.map{|posit|@board.cells[posit]}.join =~ (/X{3}|O{3}/) } 
  end
  
  def draw?
    !won? and @board.full?
  end
  
  def over?
    won? or @board.full?
  end
  
  def winner
    @board.cells[won?[0]] if won?
  end
  
  def turn
    attack = current_player.move(@board)
    if @board.valid_move?(attack)
      @board.update(attack, current_player)
    else
      turn
    end
  end
  
  def play
    
  end
  
end