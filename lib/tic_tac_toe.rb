class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
WIN_COMBINATIONS = [

    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #right columns
    [1, 4, 7], #middle columns
    [2, 5, 8], #left columns
    [0, 4, 8], #diagonals
    [2, 4, 6] #diagonals

  ]
  def display_board

     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

   end
   def input_to_index(user_input)

       index = user_input.to_i - 1

   end

   def move(index, current_player = "X")

     @board[index] = current_player

   end
   def position_taken?(index)
      if
      !(@board[index].nil? || @board[index] == " " || @board[index] == "")
      return true
    else
      return false
    end
   end

   def valid_move?(index)

     #test = index.to_i-1

     if !index.between?(0,8)
       false

     elsif !position_taken?(index)
       true
     else
       false
     end
   end

   def turn_count
     count = 0
     @board.each do|check|
       if check == "X" || check == "O"
         count += 1
       end
     end
     return count

   end

   def current_player
     if turn_count % 2 == 0
       return "X"
     else
       return "O"
     end

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
   def won?
     WIN_COMBINATIONS.each do |win_combo|
       win_index_1 = win_combo[0]
       win_index_2 = win_combo[1]
       win_index_3 = win_combo[2]

       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]

       if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combo
       end
       if position_1 == "O" && position_2 == "O" && position_3 == "O"
         return win_combo
       end
     end
     return false
   end

   def full?
     if @board.include? (" ")
       return false
     else
       return true
     end

   end
   def draw?
     if full? && !won?
       return true
     end

     if won?
       return false
     end

   end

   def over?
     if won? || draw? || full?
       return true
     else
       return false
     end
   end

   def winner
     if winning_combination = won?
       @board[winning_combination[0]]

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
end
