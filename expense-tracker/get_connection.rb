require_relative './database_connector.rb'
module GetConnection 
  def self.establish_database_connection
    db = DatabaseConnector.new('expense-tracker', 'postgres', 'password')
    db.connect
    if db.connection
      return db.connection
    else
      puts "No database connection established."
      return nil
    end
  end
end
