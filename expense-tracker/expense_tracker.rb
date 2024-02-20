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

conn = establish_database_connection
results = conn.exec('SELECT * FROM expenses')
results.each do |row|
  p row['item_name']
end
conn.close