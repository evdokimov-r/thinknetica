class Station
  attr_reader :name, :all_trains_on_station

  def initialize(name)
    @name = name
    @all_trains_on_station = []
  end

  def get_train(number_of_train)
    @all_trains_on_station.push(number_of_train)
  end

  def send_train(number_of_train)
    @all_trains_on_station.delete(number_of_train)
  end

  def train_of_type(type)
    @all_trains_on_station.select { |train| train.type == type}
  end
end
