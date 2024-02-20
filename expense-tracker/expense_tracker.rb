require_relative 'get_connection.rb'
require_relative './models/expense.rb'
require 'date'

# conn = establish_database_connection
# results = conn.exec('SELECT * FROM expenses')
# results.each do |row|
#   p row['item_name']
# end
# conn.close

class ExpenseTracker 

  def initialize
    @expense = Expense.new(GetConnection.establish_database_connection)
  end
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

  def get_valid_input
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
      return expense_date, expense_item, expense_amount
  end

  def create_expense 
    puts "Enter expense details"

    expense_date, expense_item, expense_amount = get_valid_input

    # conn = GetConnection.establish_database_connection
    # expense = Expense.new(conn)
    @expense.create(expense_date, expense_item, expense_amount)
    # puts expense.all.inspect
  end

  def read_expenses
    # conn = GetConnection.establish_database_connection
    # expense = Expense.new(conn)
    expenses = @expense.all
    print ["ID", "Name", "Description", "Amount"]   
    puts 
    expenses.each do |expense|
      print expense
      puts
    end 
  end

  def get_valid_id 
   #validate expense item id 
   user_input_id = nil 
   loop do 
     loop do
       print "Enter the existing expense item id: "
       user_input_id = gets.chomp
     
       # Validate if user_input_id is an integer
       begin
         Integer(user_input_id)
         break
       rescue ArgumentError
         puts "Invalid expense id. Please enter a valid integer id."
       end
     end
     if @expense.id_exists?(user_input_id)
       break 
     else
       puts "Invalid expense id. Please enter existing valid item id"
     end
   end
   user_input_id
  end

  def update_expense
    # conn = GetConnection.establish_database_connection
    # expense = Expense.new(conn)  
    user_input_id = get_valid_id
    new_expense_date, new_expense_item, new_expense_amount = get_valid_input
    @expense.update(user_input_id, new_expense_date, new_expense_item, new_expense_amount)
  end 

  def delete_expense 
    # conn = GetConnection.establish_database_connection
    # expense = Expense.new(conn)  
    user_input_id = get_valid_id
    @expense.delete(user_input_id)
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
      update_expense
    when 4
      puts "Delete Expense option selected."
      delete_expense
    when 5
      puts "Exiting..."
      exit
    else
      puts "Invalid choice. Please enter a number from 1 to 5."
    end
  end

  def run 
    display_menu
    user_choice = get_valid_choice
    handle_user_choice(user_choice)
    run_again? ? run : return
  end

  def run_again?
    loop do
      print "Do you want to perform other operations? (yes/no): "
      answer = gets.chomp.downcase
      return true if answer == "yes"
      return false if answer == "no"
      puts "Invalid input. Please enter 'yes' or 'no'."
    end
  end
end 
ExpenseTracker.new.run