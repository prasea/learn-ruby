require_relative 'get_connection.rb'
require_relative './models/expense.rb'

# conn = establish_database_connection
# results = conn.exec('SELECT * FROM expenses')
# results.each do |row|
#   p row['item_name']
# end
# conn.close

def display_menu 
  puts "Make your choice for expense tracker"
  puts "1. Add new expense"
  puts "2. Read existing expenses"
  puts "3. Update Expense"
  puts "4. Delete Expense"
  puts "5. Exit"
end 

def valid_choice?(choice)
  choice.match?(/^[1-5]$/)
end

def get_valid_choice
  choice = nil
  loop do
    print "Enter a valid choice in range (1-5)"
    choice = gets.chomp
    if valid_choice?(choice)
      choice = choice.to_i
      if choice >= 1 && choice <=5
        break
      end
    end
    puts "Invalid choice. Please enter a number between 1 and 5."
  end
  choice = choice.to_i
  return choice
end

def create_expense 
  conn = GetConnection.establish_database_connection
  expense = Expense.new(conn)
  expense.create('2000-01-01', 'Bara', 100)
  puts expense.all.inspect
end


def handle_user_choice(user_choice) 
  case user_choice
  when 1
    puts "Create Expense option selected."
    create_expense
  when 2
    puts "Read Expenses option selected."
  when 3
    puts "Update Expense option selected."
  when 4
    puts "Delete Expense option selected."
  when 5
    puts "Exiting..."
    exit
  else
    puts "Invalid choice. Please enter a number from 1 to 5."
  end
end

display_menu
user_choice = get_valid_choice
handle_user_choice(user_choice)