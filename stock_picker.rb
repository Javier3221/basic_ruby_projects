def pick_profit_days(stock_prices)
  buying_day = 0
  selling_day = 0
  profit = 0

  for potential_buying_day in stock_prices
    potential_selling_days = stock_prices.select do |element| 
      stock_prices.index(element) > stock_prices.index(potential_buying_day)
    end

    potential_selling_days.each do |potential_selling_day|
      potential_profit = potential_selling_day - potential_buying_day

      if potential_profit > profit
        profit = potential_profit
        buying_day = stock_prices.index(potential_buying_day)
        selling_day = stock_prices.index(potential_selling_day)
      end
    end

  end

  return [buying_day, selling_day, "$#{profit}"]
end

stock_calendar = [13, 4, 2, 6, 4, 6, 15, 1]
p pick_profit_days(stock_calendar)