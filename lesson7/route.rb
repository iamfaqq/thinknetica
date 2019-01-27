require_relative 'module/instance_counter.rb'
require_relative 'module/valid.rb'

class Route
  include InstanceCounter
  include ValidCheck

  attr_reader :stations, :begin_route, :end_route

  def initialize(begin_route, end_route)
    @begin_route = begin_route
    @end_route = end_route
    validate!
    @stations = [@begin_route, @end_route]
    register_instance
  end

  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_delete(station)
    @stations.delete(station)
  end

  protected

  def validate!
    if begin_route.nil?
      raise puts 'Начало маршрута не может быть пустым.
                  В качестве начала маршрута необходимо указать станцию.'
    end
    if end_route.nil?
      raise puts 'Поле конец маршрута не может быть пустым.
                  В качестве конца маршрута необходимо указать станцию.'
    end
  end
end
