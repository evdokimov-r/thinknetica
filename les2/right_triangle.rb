=begin
  1)Изменил на одинарные кавычки, где необходимо было
  2)Перевел сразу в integer переменные  
=end
puts 'Это программа определяет является ли треугольник прямоугольным'
puts 'Введите по очереди (через enter) значения сторон треугольника'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
if (a**2 == b**2 + c**2) || (b**2  == a**2 + c**2) || (c**2 == a**2 + b**2)
  puts 'Треугольник прямоугольный'
else
  puts 'Треугольник НЕ прямоугольный'
end
if a == b && a == c
  puts 'В добавок он еще равносторонний'
elsif a == b || a == c || b == c
  puts 'В добавок он еще равнобедренный'
end

    