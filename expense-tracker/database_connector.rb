require 'pg'

class DatabaseConnector
  attr_reader :connection

  def initialize(dbname, user, password, host = 'localhost', port = '5432')
    @dbname = dbname
    @user = user
    @password = password
  end

  def connect
    begin
      @connection = PG.connect(dbname: @dbname, user: @user, password: @password)
      # puts "Connected to database #{@dbname} successfully."
    rescue
      puts "Error connecting to database"
    end
  end

  def disconnect
    @connection.close if @connection
    puts "Disconnected from database."
  end
end
