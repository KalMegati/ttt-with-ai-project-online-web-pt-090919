class Board
  
  attr_accessor :cells
  
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def display
    puts "-----------"
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(position)
    self.cells[position.to_i-1]
  end
  
  def full?
    true if turn_count == 9
  end
  
  def turn_count
    turn = 0
    @cells.each { |position| turn += 1 unless position == " " }
    turn
  end
  
  def taken?(position)
    return false if @cells[position.to_i-1] == " "
    true
  end
  
  def valid_move?(position)
    return false unless (0..8).include?(position.to_i-1)
    not taken?(position)
  end
  
  def update(position, player)
    @cells[position.to_i-1] = player.token
  end
  
end