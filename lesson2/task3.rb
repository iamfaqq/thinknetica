# Заполнить массив числами фибоначчи до 100


fib_arr = [1,1]
(2..100).each do |i|
  fib_num = fib_arr[i-1] + fib_arr[i-2]
  if fib_num <= 100
    fib_arr.push(fib_num)
  else
    break
  end
end
puts fib_arr