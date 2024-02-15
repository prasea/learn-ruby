class MyTictac
  attr_accessor :board
  @@turn_count = 1
  def initialize 
    @player_one = 'O'
    @player_two = 'X'
    @board = Array.new(3) {Array.new(3, '-')}
  end

  def display_board(board)
    self.board.each_index do |i|
      subarray = board[i]
      subarray.each_index do |j|
        print "#{board[i][j]} | "
      end
      puts
    end
  end

  def valid_input?(input)
    input.match?(/^[1-9]$/)
  end
  
  def get_valid_index_input
    input = nil
    loop do
      print "Please enter a valid input in the range 1-9: "
      input = gets.chomp
      if valid_input?(input)
        row_index, col_index = to_2Dindex(input.to_i);
        if @board[row_index][col_index] == '-'
          # print "#{row_index}  #{col_index}"
          break
        end
      end
      puts "Invalid input. Please enter a number between 1 and 9."
    end
    input = input.to_i
    row_index, col_index = to_2Dindex(input);
    return row_index, col_index;
  end

  def draw_symbol(player, symbol) 
    row_index, col_index = get_valid_index_input
    add_to_board(row_index, col_index, symbol)
  end

  def add_to_board(row_index, col_index, symbol)
    @board[row_index][col_index] = symbol
    @@turn_count += 1
  end

  def player_turn(turn)
    if turn.odd?
      draw_symbol(@player_one_name, 'O')
    else
      draw_symbol(@player_two_name, 'X')
    end
  end

  def to_2Dindex(input)
    case input 
    when 1
      row_index = 0 
      col_index = 0          
    when 2
      row_index = 0 
      col_index = 1          
    when 3
      row_index = 0
      col_index = 2
    when 4
      row_index = 1
      col_index = 0
    when 5
      row_index = 1
      col_index = 1
    when 6
      row_index = 1
      col_index = 2
    when 7
      row_index = 2
      col_index = 0
    when 8
      row_index = 2
      col_index = 1
    when 9
      row_index = 2
      col_index = 2   
    else 
      puts "Enter a valid index"      
    end 
    return row_index, col_index
  end

  def play_game
    puts 
    @board = Array.new(3) {Array.new(3, '-')}
    display_board(@board)
    puts 
    
    until @@turn_count >= 10 do
      # puts @@turn_count
      if @@turn_count.odd?
        puts "Player #{@player_one} turn's : "
      else 
        puts "Player #{@player_two} turn's : "      
      end
      player_turn(@@turn_count)
      display_board(@board)
      if check_win('X')
        puts "Player X wins!"
        break
      elsif check_win('O')
        puts "Player O wins!"
        break
      end
    end
    if @@turn_count > 9
      puts "Its draw"
    end
    @@turn_count = 1
    play_again? ? play_game : return
  end
  def check_win(symbol)
    # Check rows
    @board.each do |row|
      return true if row.all? { |cell| cell == symbol }
    end

    # Check columns
    @board.transpose.each do |col|
      return true if col.all? { |cell| cell == symbol }
    end

    # Check diagonals
    diagonal1 = [@board[0][0], @board[1][1], @board[2][2]]
    diagonal2 = [@board[0][2], @board[1][1], @board[2][0]]

    return true if diagonal1.all? { |cell| cell == symbol }
    return true if diagonal2.all? { |cell| cell == symbol }

    false
  end
  def play_again?
    loop do
      print "Do you want to play again? (yes/no): "
      answer = gets.chomp.downcase
      return true if answer == "yes"
      return false if answer == "no"
      puts "Invalid input. Please enter 'yes' or 'no'."
    end
  end
end 

my_tictac = MyTictac.new 
my_tictac.play_game