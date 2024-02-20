require_relative 'database_connector.rb'
def establish_database_connection
  db = DatabaseConnector.new('expense-tracker', 'postgres', 'password')
  db.connect
  if db.connection
    return db.connection
  else
    puts "No database connection established."
    return nil
  end
end

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

display_menu
get_valid_choice