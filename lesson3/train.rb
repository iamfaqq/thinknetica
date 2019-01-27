# Класс Train (Поезд):
# Имеет номер (произвольная строка) и тип (грузовой, пассажирский) и количество вагонов, эти данные указываются при создании экземпляра класса
# Может набирать скорость
# Может возвращать текущую скорость
# Может тормозить (сбрасывать скорость до нуля)
# Может возвращать количество вагонов
# Может прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может осуществляться только если поезд не движется.
# Может принимать маршрут следования (объект класса Route). 
# При назначении маршрута поезду, поезд автоматически помещается на первую станцию в маршруте.
# Может перемещаться между станциями, указанными в маршруте. Перемещение возможно вперед и назад, но только на 1 станцию за раз.
# Возвращать предыдущую станцию, текущую, следующую, на основе маршрута


class Train

  attr_reader :name, :type, :parts, :current_speed

  def initialize(name, type, parts)
    @name = name
    @type = type
    @parts = parts
    @current_speed = 0
  end

  def speed_up(speed)
    @current_speed += speed
  end

  def stop
    @current_speed = 0
  end

  def part_add

    if @current_speed == 0
      @parts + 1
    else
      puts "train need stop"
    end

  end

  def part_delete

    if @current_speed == 0
      @parts - 1
    else
      puts "train need stop"
    end

  end

  def train_set_route(route)
    @train_route = route
    @current_station = @train_route.begin
  end

  def station_next
    next_station = @train_route.index[@current_station]
    @train_route[next_station + 1]
  end

  def current_station
    @current_station
  end

  def prev_station
    prev_station = @train_route.index[@current_station]
    @train_route[prev_station - 1]
  end

end