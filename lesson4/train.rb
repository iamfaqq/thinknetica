require_relative '../lesson4/module/module.rb'

class Train

  include Firmware
  include TrainFind
  include InstanceCounter
  attr_reader :name, :type, :current_speed, :train_route, :parts_list, :current_station, :number

  def initialize(name, number)
    @name = name.to_s
    @number = number.to_i
    @current_speed = 0
    @parts_list = []
    @current_station_index = 0
    Train.add self
  end

  def speed_up(speed)
    @current_speed += speed
  end

  def stop
    @current_speed = 0
  end

  def part_add(part)
    if @current_speed == 0 and part.type == @type
      @parts_list << part
    else
      puts "train need stop or type incorrect"
    end
  end

  def part_delete(part)
    if @current_speed == 0
      @parts_list.delete(part)
    else
      puts "train need stop"
    end
  end

  def train_set_route(route)
    @train_route = route
    @current_station = @train_route.begin_route
    @current_station.train_come(self)
  end

  def forward
    if @current_station_index == 0
      @current_station.train_out(self)
      @current_station = @train_route.stations[@current_station_index + 1]
      @current_station.train_come(self)
      @current_station_index += 1
    elsif @current_station == @train_route.end
      puts 'Это последняя станция'
    else
      @current_station.train_out(self)
      @current_station = @train_route.stations[@current_station_index + 1]
      @current_station.train_come(self)
      @current_station_index += 1
    end
  end

  def station_next
    next_station = @train_route.index[@current_station]
    @train_route[next_station + 1]
  end

  def prev_station
    prev_station = @train_route.index[@current_station]
    @train_route[prev_station - 1]
  end

  def backward
    if @current_station_index == 0
      puts 'Это первая станция'
    else
      @current_station.train_out(self)
      @current_station = @train_route.stations[@current_station_index - 1]
      @current_station.train_come(self)
      @current_station_index -= 1
    end
  end

end





