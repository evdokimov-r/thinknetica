class Route
  include InstanceCounter
  attr_reader :first_station, :last_station, :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]

    register_instance
    validate!
  end

  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  def add_station(index = -2, station)
    @stations.insert(index, station)
  end

  def delete_station(station)
    @stations.delete(station)
  end

  def validate!
    raise ArgumentError, "Начальная и конечная станции должны отличаться" if first_station == last_station
  end 
end