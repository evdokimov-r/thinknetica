require_relative 'wagon'
class PassengerWagon < Wagon
  def initialize
    @type = :pax
  end

  def add_wagon(wagon)
  super(wagon) if train.type == :pax
  end

end
