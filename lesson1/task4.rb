# Квадратное уравнение. 
# Пользователь вводит 3 коэффициента a, b и с. 
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и выводит значения дискриминанта и корней на экран. 
# При этом возможны следующие варианты:
#   Если D > 0, то выводим дискриминант и 2 корня
#   Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
#   Если D < 0, то выводим дискриминант и сообщение "Корней нет"


puts "Введите первый коэфицент"
a = gets.chomp.to_f
puts "Введите второй коэфицент"
b = gets.chomp.to_f
puts "Введите третий коэфицент"
c = gets.chomp.to_f

d = b**2 - (4 * a * c)

if d > 0
  sqrt_d = Math.sqrt(d)
  x1 = (-b + sqrt_d) / 2 * a
  x2 = (-b - sqrt_d) / 2 * a
  puts "#{x1; x2}"
elsif d == 0
  sqrt_d = Math.sqrt(d)
  x1 = (-b + sqrt_d) / 2 * a
  puts "#{x1}"
else
  puts "Корней нет"
end




