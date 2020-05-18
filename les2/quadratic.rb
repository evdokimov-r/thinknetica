puts "Программа по решению квадратного уравнения"
puts "Введите значения квдаратного уравнения ax^2 + bx + c = 0"
a = gets.chomp
b = gets.chomp
c = gets.chomp
d = b.to_i**2 - 4*a.to_i*c.to_i
if d.to_i > 0
  puts "Дискриминант D = #{d}, корни уравнения x1 = #{(-b.to_i + Math.sqrt(d.to_i))/(2*a.to_i)} и x2 = #{(-b.to_i - Math.sqrt(d.to_i))/(2*a.to_i)}"
elsif d.to_i == 0
  puts "Дискриминант D = 0, один корень уравения x = #{(-b.to_i)/(2*a.to_i)}"
else
  puts "Дискриминант D < 0, корней нет."
end