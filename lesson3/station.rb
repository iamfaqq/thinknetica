# Класс Station (Станция):
# Имеет название, которое указывается при ее создании
# Может принимать поезда (по одному за раз)
# Может возвращать список всех поездов на станции, находящиеся в текущий момент
# Может возвращать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
# Может отправлять поезда (по одному за раз, при этом, поезд удаляется из списка поездов, находящихся на станции).


class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def train_come(train)
    @trains << train
  end

  def trains_list_type
    @trains.each do |train|
      if train.type == 'light'
        light_train += 1
      else
        heavy_train += 1
      end
      puts "В данный момент на станции всего поездов #{light_train + heavy_train}, из них легковых #{light_train}, грузовых #{heavy_train}"
    end
  end

  def train_out(train)
    @trains.delete(train)
  end

end