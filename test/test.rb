array = [['X',2,3],[4,'X',6],[7,8,'X']]

array.each do |row|
  p "Hello" if row.all? { |cell| cell == 'X' }
end

# Check diagonals
diagonal1 = [array[0][0], array[1][1], array[2][2]]
diagonal2 = [array[0][2], array[1][1], array[2][0]]

p "hello" if diagonal1.all? { |cell| cell == 'X' }
p 'world' if diagonal2.all? { |cell| cell == 'X' }