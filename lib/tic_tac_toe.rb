class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn = turn_count
    if turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      pos1 = @board[array[0]]
      pos2 = @board[array[1]]
      pos3 = @board[array[2]]
      if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
        return array
      end
    end
    return false
  end

  def full?
    @counter = 0
    board.each do |take|
      if !position_taken?(counter)
        return false
      end
      counter += 1
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if draw?
      return true
    elsif won?
      return true
    else
      false
    end
  end
  
  def winner
    if won?
      WIN_COMBINATIONS.each do |array|
        pos1 = @board[array[0]]
        pos2 = @board[array[1]]
        pos3 = @board[array[2]]
        if pos1 == pos2 && pos1 == pos3 && pos1 != " " && pos1 != ""
          return pos1
        end
      end
    end
  end

  def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end