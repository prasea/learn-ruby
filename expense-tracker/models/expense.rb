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

  def update(id, new_date, new_name, new_price)
    @conn.exec_params("UPDATE expenses SET date = $1, item_name = $2, item_price = $3 WHERE id = $4",
    [new_date, new_name, new_price, id])
  end


  def id_exists?(id)
    result = @conn.exec_params("SELECT COUNT(*) FROM expenses WHERE id = $1", [id])
    count = result[0]['count'].to_i
    count > 0
  end

  def all
    @conn.exec('SELECT * FROM expenses').values
  end
end