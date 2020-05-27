class Route
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end

  def add_station(index = -2, station)
    @stations.insert(index, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

end