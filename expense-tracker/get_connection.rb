require_relative './database_connector.rb'
require_relative './config.rb'
module GetConnection 
  def self.establish_database_connection
    db = DatabaseConnector.new(Config::DB_NAME, Config::USERNAME, Config::PASSWORD)
    db.connect
    if db.connection
      return db.connection
    else
      puts "No database connection established."
      return nil
    end
  end
end
