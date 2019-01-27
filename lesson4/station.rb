require_relative '../lesson4/module/module.rb'

class Station

  include StationList
  include InstanceCounter

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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

end