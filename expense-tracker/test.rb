def valid_amount?(amount_str)
  # return false if amount_str == "0"
  /^\d+(\.\d{1,2})?$/.match?(amount_str)
end

# Validate amount input
amount = nil
loop do
  print "Amount: "
  amount_str = gets.chomp
  if amount_str == "0"
    puts "Invalid amount. Amount cannot be 0."
  elsif valid_amount?(amount_str)
    amount = amount_str.to_f
    break
  else
    puts "Invalid amount. Please enter a valid number."
  end
end

