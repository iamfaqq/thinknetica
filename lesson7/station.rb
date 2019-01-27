require_relative 'module/instance_counter.rb'
require_relative 'module/station_list'
require_relative 'module/valid.rb'

class Station
  include StationList
  include InstanceCounter
  include ValidCheck

  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
    @light_train = 0
    @heavy_train = 0
    validate!
    Station.add self
    register_instance
  end

  def train_come(train)
    @trains << train
  end

  def trains_list_type
    @trains.each do |train|
      if train.type == 'пассажирский'
        @light_train += 1
      else
        @heavy_train += 1
      end
      puts "В данный момент на станции всего поездов #{@light_train + @heavy_train},
            из них легковых #{@light_train}, грузовых #{@heavy_train}"
    end
  end

  def train_out(train)
    @trains.delete(train)
  end

  def each_train
    trains.each { |train| yield(train) }
  end

  protected

  def validate!
    raise 'Имя не может быть пустым' if name.nil?
    raise 'Имя не может быть меньше 5 символов' if name.length < 5
    true
  end
end
