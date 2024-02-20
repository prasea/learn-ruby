require 'pg'

conn = PG.connect(dbname: 'expense-tracker', user: 'postgres', password: 'password', host: 'localhost')

results = conn.exec('SELECT * FROM expenses')
results.each do |row|
  p row['item_name']
end
conn.close