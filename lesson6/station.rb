require_relative 'module/instance_counter.rb'
require_relative 'module/station_list'
require_relative 'module/valid.rb'

class Station

  include StationList
  include InstanceCounter
  include ValidCheck

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    validate!
    Station.add self
    register_instance
  end

  def train_come(train)
    @trains << train
  end

=begin
  def trains_list_type
    @trains.each do |train|
      if train.type == 'Пассажирский'
        light_train += 1
      else
        heavy_train += 1
      end
      puts "В данный момент на станции всего поездов #{light_train + heavy_train}, из них легковых #{light_train}, грузовых #{heavy_train}"
    end
  end
=end

  def train_out(train)
    @trains.delete(train)
  end

  protected

  def validate!
    #проверка имени
    raise 'Имя не может быть пустым' if name.nil?
    raise 'Имя не может быть меньше 5 символов' if name.length < 5
    true
  end

  end