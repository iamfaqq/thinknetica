# Класс Route (Маршрут):
# Имеет начальную и конечную станцию, а также список промежуточных станций. Начальная и конечная станции указываютсся при создании маршрута, а промежуточные могут добавляться между ними.
# Может добавлять промежуточную станцию в список
# Может удалять промежуточную станцию из списка
# Может выводить список всех станций по-порядку от начальной до конечной


class Route

  attr_reader :stations, :begin, :end

  def initialize(begin_route, end_route)
    @begin = begin_route
    @end = end_route
    @stations = []
  end

  def station_add(station)
    @stations << station
  end

  def station_delete(station)
    @stations.delete(station)
  end

end