class Station
  include InstanceCounter
  attr_reader :name, :stations, :trains

  def initialize(name)
    @name = name
    @stations = []
    @trains = []
    
    register_instance
  end

  def get_train(number)
    @stations.push(number)
  end

  def send_train(number)
    @stations.delete(number)
  end

  def train_of_type(type)
    @stations.select { |train| train.type == type }
  end

  def self.all
    @stations
  end  
end
