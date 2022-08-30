def stock_picker(array)
  days_pair = []
  #pairs each stock price and takes the combinations where the first price is lower than the second price
  stock_combinations = array.repeated_permutation(2).select {|first, second| second > first}
  ordered_stock_combinations = stock_combinations.select {|first, second| array.index(first) < array.index(second)}
  #picks the combination with the largest difference/profit
  optimal_pick = ordered_stock_combinations.max_by {|price| price[1] - price[0]}
  days_pair[0] = array.index(optimal_pick[0])
  days_pair[1] = array.index(optimal_pick[1])
  days_pair
end