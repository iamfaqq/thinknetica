class Menu

  def initialize
    @station_all = []
    @routes_all= []
    @trains_all = []
  end


  def choice

    loop do
      puts  'Выберите действие
         1. Создать станцию 2. Создать поезд
         3. Создать маршрут 4. Добавить станции к маршруту
         5. Удалить станцию 6. Назначить маршрут поезду
         7. Добавить вагон к поезду 8. Отцепить вагон от поезда
         9. Переместить поезд вперед по маршруту 10. Переместить поезд назад по маршруту
         11. Просмотреть список станций 12.Просмотреть список поездов на станции'

      @choice = gets.chomp.to_i

      case @choice
        when 1
          make_station
        when 2
          make_train
        when 3
          make_route
        when 4
          route_station_add
        when 5
          route_station_delete
        when 6
          train_route_add
        when 7
          add_train_part
        when 8
          delete_train_part
        when 9
          train_forward
        when 10
          train_backward
        when 11
          stations_list
        when 12
          trains_on_station
          break
        else
          puts 'Введите число от 1 до 12'
      end
    end
  end

  #методы должны быть доступны для взызова только изнутри класса
  private

  def make_station
    puts 'Введите имя станции'
    station = gets.chomp
    @station_all << Station.new(station)
    puts 'Станция создана'
  rescue RuntimeError => e
     puts e.message
    retry
  end

  def make_train
    puts 'Введите имя поезда'
    train_name = gets.chomp
    puts 'Введите номер поезда'
    train_number = gets.chomp.to_s
    puts 'Выберите тип поезда
            1 - пассажирский
            2 - грузовой'
    train_type = gets.chomp.to_i
    if train_type == 1
      train = PassengerTrain.new(train_name, train_number)
      @trains_all << train
      puts 'Поезд создан'
    elsif train_type == 2
      train = CargoTrain.new(train_name, train_number)
      @trains_all << train
      puts 'Поезд создан'
    else
      puts 'Введено некорректное значение'
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def make_route
    stations_list
    puts 'Выберите начальную станцию'
    first_choice = gets.chomp.to_i - 1
    begin_route  = @station_all[first_choice]
    puts 'Выберите конечную станцию'
    second_choice = gets.chomp.to_i - 1
    end_route = @station_all[second_choice]
    @routes_all << Route.new(begin_route, end_route)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def route_station_add
    routes_list
    puts 'Выберите маршрут'
    route = gets.chomp.to_i - 1
    stations_list
    puts 'Выберите станцию'
    station = gets.chomp.to_i - 1
    @routes_all[route].station_add(@station_all[station])
  end

  def route_station_delete
    routes_list
    puts 'Выберите маршрут'
    route = gets.chomp.to_i - 1
    stations_list
    puts 'Выберите станцию'
    station = gets.chomp.to_i - 1
    @routes_all[route].station_delete(@station_all[station])
  end

  def train_route_add
    puts 'Выберите поезд'
    trains_list
    train = gets.chomp.to_i - 1
    puts 'Выберите маршрут'
    routes_list
    route = gets.chomp.to_i - 1
    @trains_all[train].train_set_route(@routes_all[route])
  end

  def add_train_part
    puts 'Выберите поезд'
    trains_list
    train = gets.chomp.to_i - 1
    if @trains_all[train].type == 'Пассажирский'
       @trains_all[train].part_add(Part.new('Пассажирский'))
      puts 'Вагон добавлен'
    elsif @trains_all[train].type == 'Грузовой'
      @trains_all[train].part_add(Part.new('Грузовой'))
      puts 'Вагон добавлен'
    else
      puts 'Выберите поезд'
      trains_list
    end


  end

  def delete_train_part
    puts 'Выберите поезд'
    trains_list
    train = gets.chomp.to_i - 1
    puts 'Выберите вагон'
    train_parts_list(train)
    part = gets.chomp.to_i - 1
    @trains_all[train].part_delete(part)
    puts 'Вагон удален'
  end

  def train_forward
    puts 'Выберите поезд'
    trains_list
    train = gets.chomp.to_i - 1
    @trains_all[train].forward
    puts 'Поезд перемещен'
  end

  def train_backward
    puts 'Выберите поезд'
    trains_list
    train = gets.chomp.to_i - 1
    @trains_all[train].backward
    puts 'Поезд перемещен'
  end

  def stations_list
    @station_all.each.with_index(1) { |station, i| puts "#{station.name}: #{i}." }
  end

  def trains_on_station
    puts 'Выберите станцию'
    stations_list
    station = gets.chomp.to_i - 1
    @station_all[station].trains.each { |trains| puts "#{trains.name} #{trains.type}." }
  end

  def routes_list
    @routes_all.each.with_index(1) { |route, i| puts "#{i}: #{route.begin_route.name} - #{route.end_route.name}." }
  end

  def trains_list
    @trains_all.each.with_index(1) { |train, i| puts "#{i}: #{train.name} #{train.type}." }
  end

  def train_parts_list (train)
    @trains_all[train].parts_list.each.with_index(1) { |part, index|puts "#{index}: #{part}." }
  end

  end
