class Train
  include InstanceCounter
  include Company
  attr_reader :speed, :number, :type, :wagons, :current_station, :route

  def initialize(number)
    @number = number
    @type = type
    @wagons = []
    @speed = 0
    register_instance
  end

  def self.find(number)
    search = @trains.select { |train| train.number == number }
    if search.empty? puts 'nill'
  end

  def increase_speed
    @speed += 10
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def delete_wagon(wagon)
    @wagons.delete(wagon) if @speed.zero? && @wagons.any?
  end 

  def add_wagon(wagon)
    @wagons << wagon if  @speed.zero? && wagon.type == @type
  end

  def get_route(route)
    @route = route
    @current_station = route.stations.first
    @current_station.get_train(self)
  end

  def to_next_station
    return if next_station.nil?

    @current_station.send_train(self)
    @current_station = next_station
    @current_station.get_train(self)
  end

  def to_prev_station
    return if prev_station.nil?

    @current_station.send_train(self)
    @current_station = prev_station
    @current_station.get_train(self)
  end



  attr_accessor :current_station

  def speed_up
    @speed += 1
  end

  def current_speed
    @speed
  end

  def stop
    @speed = 0
  end

  def next_station
    unless @current_station == @route.stations.last
      next_station = @route.stations[@route.stations.find_index(@current_station) + 1]
    end
    next_station
  end

  def prev_station
    unless @current_station == @route.stations.first
      prev_station = @route.stations[@route.stations.find_index(@current_station) - 1]
    end
    prev_station
  end
end