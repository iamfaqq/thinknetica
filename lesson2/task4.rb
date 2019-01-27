# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).


words =  ['A','E','I','O','U']
new_hash = {}

('A'..'Z').each.with_index(1) do |letter, index|
  new_hash[index] = letter if words.include?(letter)
end
puts new_hash