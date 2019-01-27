require_relative '../lesson4/module/module.rb'

class Route

  include InstanceCounter
  attr_reader :stations, :begin_route, :end_route

  def initialize(begin_route, end_route)
    @begin_route = begin_route
    @end_route = end_route
    @stations = [@begin_route, @end_route]
    register_instance
  end

  def station_add(station)
    @stations.insert(-2, station)
  end

  def station_delete(station)
    @stations.delete(station)
  end
end