require_relative '../database_connector.rb'
require_relative '../get_connection.rb'
class Expense
  def initialize(conn)
    @conn = conn
  end

  def create_table
    @conn.exec('CREATE TABLE IF NOT EXISTS users (id SERIAL PRIMARY KEY, name TEXT)')
  end

  def create(date, name, price)
    @conn.exec_params('INSERT INTO expenses (date, item_name, item_price) VALUES ($1, $2, $3)', [date, name, price])
  end

  def all
    @conn.exec('SELECT * FROM expenses').values
  end
end