puts "Это программа - узнай свой идеальный вес"
puts "Введите Ваше имя"
first_name = gets.chomp
puts "Введите свой рост"
user_height = gets.chomp
if user_height.to_i > 110
  puts "#{first_name.capitalize}, Ваш идеальный вес - #{(user_height.to_i - 110)*1.15}кг."
else
  puts "Ваш вес уже оптимальный."
end