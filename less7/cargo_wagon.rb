require_relative 'wagon'
class CargoWagon < Wagon
  def initialize
    @type = :cargo
  end
  def add_wagon(wagon)
  super(wagon) if train.type == :pax
  end
end
