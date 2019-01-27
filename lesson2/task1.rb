# Хеш, содеращий месяцы и количество дней в месяце. 
# В цикле выводить те месяцы, у которых количество дней ровно 30


hash = {
    january: 31,
    february: 28,
    march: 31,
    april: 30,
    may: 31,
    june: 30,
    july: 31,
    august: 30,
    september: 30,
    october: 31,
    november: 30,
    december: 31
}
hash.each do |months, day|
  puts "Месяц где количество дней ровно 30 - #{months}" if day == 30
end

