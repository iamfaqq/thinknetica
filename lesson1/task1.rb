# Идеальный вес.
# Программа запрашивает у пользователя имя и рост и выводит идеальный вес по формуле <рост> - 110, после чего выводит результат пользователю на экран с обращением по имени. 
# Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный" 
 

puts "Как тебя зовут?"
name = gets.chomp
puts "Какой у тебя рост?"
height = gets.chomp.to_i

optimal_weight = height - 110

if  optimal_weight > 0
  puts "#{name} привет, твой оптимальный вес #{optimal_weight} кг"
else
  puts "#{name} привет, твой вес уже оптимальный"
end