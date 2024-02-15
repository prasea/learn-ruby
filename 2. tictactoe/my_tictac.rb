class MyTictac
  attr_accessor :board
  @@turn_count = 1
  def initialize 
    @board = Array.new(3) {Array.new(3, '-')}
  end 
  def display_board
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
          print "#{row_index}  #{col_index}"
          break
        end
      end
      puts "Invalid input. Please enter a number between 1 and 9."
    end
    input = input.to_i
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
  
end 

my_tictac = MyTictac.new 
my_tictac.display_board
my_tictac.get_valid_index_input