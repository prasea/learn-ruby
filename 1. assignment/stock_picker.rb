def stock_picker(prices)
  buy_price_index = 0
  buy_price = prices[buy_price_index]
  sell_price_index = 1
  max_profit = 0

  for i in 1...prices.length 
    if prices[i] < buy_price
      buy_price = prices[i]
    else 
      current_profit = prices[i] - buy_price
      if current_profit > max_profit
        sell_price_index = i
        buy_price_index = prices.index(buy_price)
        max_profit = current_profit 
      end 
      # max_profit = [current_profit, max_profit].max 
    end
  end 
  return buy_price_index, sell_price_index, max_profit
end 
buy_day, sell_day, max_profit = stock_picker([17,3,6,9,15,8,6,1,10])
puts "You should buy in day #{buy_day}"
puts "You should sell in day #{buy_day}"
puts "The maximum profit achieved is #{max_profit}"
puts "Buy day #{buy_day} Sell day #{sell_day}"
