=begin
  1)Где можно поменял на одинарные кавчыки
  2)Переменные сразу перевел в integer
  3)Арифмитические операции оформил по стайлгайду
  4)Дискриминант поправил
=end

puts 'Программа по решению квадратного уравнения'
puts 'Введите значения квдаратного уравнения ax^2 + bx + c = 0'
a = gets.chomp.to_i
b = gets.chomp.to_i
c = gets.chomp.to_i
d = b**2 - 4 * a * c 
if d > 0
  puts "Дискриминант D = #{d}, корни уравнения x1 = #{(- b + Math.sqrt(d))/(2 * a)} и x2 = #{(- b - Math.sqrt(d))/(2 * a)}"
elsif d == 0
  puts "Дискриминант D = 0, один корень уравения x = #{(- b)/(2 * a)}"
else
  puts 'Дискриминант D < 0, корней нет.'
end