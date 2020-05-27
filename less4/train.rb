class Train
  attr_reader :speed, :number_of_train, :type, :wagons
  def initialize(number_of_train, type, wagons)
    @number_of_train = number_of_train
    @type = type
    @wagons = wagons
    @speed = 0
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

  def delete_wagon
    @wagons -= 1 if @speed == 0 && @wagons > 0
  end

  def add_wagon
    @wagons += 1 if @speed == 0 && @wagons > 0
  end

  def get_route(route)
    @route = route
    @current_station = 0
    @route.stations[@current_station]
  end

   def show_next_station
    @route.stations[@current_station_index + 1] if @current_station_index != @route.stations.size - 1
  end

  def show_prev_station
    @route.stations[@current_station_index - 1] if @current_station_index != 0
  end

  def go_next_station
    go(next_station_index)
  end

  def go_prev_station
    go(prev_station_index)
  end

  private 

  def next_station_index
    @current_station_index + 1 if @current_station_index && @current_station_index != @route.stations.length - 1
  end

  def prev_station_index
    @current_station_index - 1 if @current_station_index && @current_station_index != 0
  end

  def go(station_index)
    @route.stations[@current_station].send_train(self)
    
    @current_station_index = station_index
    @route.stations[station_index].get_train(self)
  end
end