def stock_picker(prices)
	max_profits = {}
	for i in (0..(prices.length-1))
		max_profit = 0
		for j in (i+1..(prices.length-1))
			profit = prices[j] - prices[i]
			if profit > max_profit
				max_profit = profit
				max_profit_days = [i,j]		
			end	
		end
	max_profits[max_profit] = max_profit_days
	end

	best = max_profits.keys.max
	return max_profits[best]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])
