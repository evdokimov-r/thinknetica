puts 'Введите число в месяце'
day = gets.chomp.to_i
puts 'Введите месяц (в цифрах), например 1, 5, 10'
month = gets.chomp.to_i
puts 'Введите год'
year = gets.chomp.to_i

if ((year % 4) == 0 && (year % 100) != 0) || (year % 4) == 0 && (year % 100) == 0 && (year % 400) == 0 
  february = 29
else 
  february = 28
end

days_in_month = [31, february, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

sum_days = days_in_month.take(month - 1).sum
puts "Дней с начала года: #{sum_days + day}"

if february == 29
  puts "#{year} год високосный"
else
  puts "#{year} год  не високосный"
end
