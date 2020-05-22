hash_name_of_goods = Hash.new 

loop do
  puts 'Название товара'
  name_of_good = gets.chomp
  break if name_of_good.downcase ==  'стоп'
  puts 'Цена за товара за еденицу'
  price_for_one = gets.chomp.to_f
  puts 'Количество товара'
  quantity = gets.chomp.to_f
  hash_name_of_goods[name_of_good] = Hash[price_for_one: price_for_one, quantity: quantity, total: price_for_one * quantity]
end

puts "Итоговый хэш: #{hash_name_of_goods}"
hash_name_of_goods.each { |key, value| puts "Вы купили #{key} - #{value[:quantity]}шт по #{value[:price_for_one]}$. Итого за данный товар: #{value[:total]}$" }

puts "Итоговая сумма покупок:"
print hash_name_of_goods.each_value.sum { |value| value[:total]}

