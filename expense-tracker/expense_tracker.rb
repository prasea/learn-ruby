require_relative 'get_connection.rb'
require_relative './models/expense.rb'
require 'date'

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

def valid_amount?(amount_str)
  # return false if amount_str == "0"
  /^\d+(\.\d{1,2})?$/.match?(amount_str)
end

def create_expense 
  conn = GetConnection.establish_database_connection
  puts "Enter expense details"

  # Validate date input
  expense_date = nil
  loop do
    print "Enter the date when the expense was made (YYYY-MM-DD):  "
    str_date = gets.chomp
    begin
      expense_date = Date.parse(str_date)
      break if expense_date <= Date.today
      puts "Invalid date. Future dates are not allowed."
    rescue ArgumentError
      puts "Invalid date format. Please enter the date in YYYY-MM-DD format."
    end
  end

  # Validate amount input
  expense_amount = nil
  loop do
    print "Enter the expense amount:  "
    str_amount = gets.chomp
    if str_amount == "0"
      puts "Invalid amount. Amount cannot be 0."
    elsif valid_amount?(str_amount)
      expense_amount = str_amount.to_f
      break
    else
      puts "Invalid amount. Please enter a valid number."
    end
  end

  # Validate item input
  expense_item = nil 
  loop do 
    print "Enter the expense item:  "
    expense_item = gets.chomp
    if !expense_item.nil? && !expense_item.strip.empty?
      break
    else 
      puts "Invalid expense item name. Please enter a valid name"
    end
  end

  expense = Expense.new(conn)
  expense.create(expense_date, expense_item, expense_amount)
  # puts expense.all.inspect
end

def read_expenses
  conn = GetConnection.establish_database_connection
  expense = Expense.new(conn)
  expenses = expense.all
  print ["ID", "Name", "Description", "Amount"]   
  puts 
  expenses.each do |expense|
    print expense
    puts
  end 
end

def handle_user_choice(user_choice) 
  case user_choice
  when 1
    puts "Create Expense option selected."
    create_expense
  when 2
    puts "Read Expenses option selected."
    read_expenses
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

loop do 
  display_menu
  user_choice = get_valid_choice
  handle_user_choice(user_choice)
end 