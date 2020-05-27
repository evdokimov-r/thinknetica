class Station
  attr_reader :name, :stations

  def initialize(name)
    @name = name
    @stations = []
  end

  def get_train(number_of_train)
    @stations.push(number_of_train)
  end

  def send_train(number_of_train)
    @stations.delete(number_of_train)
  end

  def train_of_type(type)
    @stations.select { |train| train.type == type}
  end
end
